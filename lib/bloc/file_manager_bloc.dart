import 'dart:io';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/data/repository/file_repository.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../data/models/file_data_model.dart';
import '../data/models/file_data_status.dart';
import '../services/file_manager_service.dart';
part 'file_manager_event.dart';
part 'file_manager_state.dart';

class FileManagerBloc extends Bloc<FileManagerEvent, FileManagerState> {
  final FileRepository _fileRepository = FileRepository();
  FileManagerBloc()
      : super(
    const FileManagerState(
      progress: 0.0,
      newFileLocation: "", books: [], searchResults: [],
    ),
  ) {
    on<DownloadFileEvent>(_downloadFile);
    on<CategoryBooksEvent>(_categoryBooks);
    on<SearchBooksEvent>(_searchBooks);
  }

  Future<void> _downloadFile(DownloadFileEvent event, emit) async {
    Dio dio = Dio();
    FileStatusModel fileStatusModel =
    await FileManagerService().checkFile(event.fileDataModel);
    if (fileStatusModel.isExist) {
      OpenFilex.open(fileStatusModel.newFileLocation);
    } else {
      await dio.download(
        event.fileDataModel.fileUrl,
        fileStatusModel.newFileLocation,
        onReceiveProgress: (count, total) async {
          emit(state.copyWith(progress: count / total));
        },
      );
      emit(
        state.copyWith(
          progress: 1,
          newFileLocation: fileStatusModel.newFileLocation,
        ),
      );
    }

    event.fileDataModel;
    bool hasPermission = await _requestWritePermission();
    if (!hasPermission) return;


    Directory? directory = await getDownloadPath();
    String downloadUrl = event.fileDataModel.fileUrl;

    // users/files/Download/PythonBook1.pdf

    String savedLocation =
        "${directory?.path}/${event.fileDataModel.fileName}${downloadUrl.substring(downloadUrl.length - 5, downloadUrl.length)}";

    debugPrint("SAQLANAYOTGAN FILE LOCATION:$savedLocation");

    var allFiles = directory?.list();

    List<String> filePaths = [];

    await allFiles?.forEach((element) {
      debugPrint("FILES IN DOWNLOAD FOLDER:${element.path}");
      filePaths.add(element.path.toString());
    });

    if (filePaths.contains(savedLocation)) {
      OpenFilex.open(savedLocation);
      emit(state.copyWith(newFileLocation: savedLocation));
    } else {
      await dio.download(
        downloadUrl,
        savedLocation,
        onReceiveProgress: (count, total) {
          emit(
            state.copyWith(progress: count / total),
          );
        },
      );
      emit(
        state.copyWith(
          progress: 1,
          newFileLocation: savedLocation,
        ),
      );
    }
  }
  Future<void> _categoryBooks(
      CategoryBooksEvent event, Emitter<FileManagerState> emit) async {
    List<FileDataModel> fileData;

    if (event.genre == 'All') {
      fileData = _fileRepository.files;
    } else {
      fileData = _fileRepository.files
          .where((element) => element.bookGenre == event.genre)
          .toList();
    }

    emit(state.copyWith(books: fileData, searchResults: []));
  }


  Future<void> _searchBooks(SearchBooksEvent event, emit) async {
    List<FileDataModel> searchResults;

    if (event.query.isEmpty) {
      searchResults = [];
    } else {
      searchResults = state.books
          .where((element) =>
          element.fileName.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
    }

    emit(state.copyWith(searchResults: searchResults));
  }
  Future<bool> _requestWritePermission() async {
    await Permission.storage.request();
    return await Permission.storage.request().isGranted;
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      debugPrint("Cannot get download folder path");
    }
    return directory;
  }
}