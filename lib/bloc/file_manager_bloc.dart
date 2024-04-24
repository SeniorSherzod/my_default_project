import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';

import '../data/models/file_data_model.dart';
import '../data/models/file_data_status.dart';
import '../services/file_manager_service.dart';

part 'file_manager_event.dart';
part 'file_manager_state.dart';

class FileManagerBloc extends Bloc<FileManagerEvent, FileManagerState> {
  FileManagerBloc()
      : super(
    const FileManagerState(
      progress: 0.0,
      newFileLocation: "",
      books: [],
      searchResults: [],
    ),
  ) {
    on<DownloadFileEvent>(_downloadFile);
    on<CategoryBooksEvent>(_filterByCategory);
    on<SearchBooksEvent>(_searchBooks);
  }

  Future<void> _downloadFile(
      DownloadFileEvent event,
      Emitter<FileManagerState> emit,
      ) async {
    Dio dio = Dio();

    FileStatusModel fileStatusModel = await getStatus(event.fileDataModel);

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
      await FileManagerService.init();
      emit(
        state.copyWith(
          progress: 1,
          newFileLocation: fileStatusModel.newFileLocation,
        ),
      );
    }
  }

  Future<void> _filterByCategory(CategoryBooksEvent event, Emitter<FileManagerState> emit) async {
    final List<FileDataModel> filteredBooks = event.genre == 'All'
        ? state.books
        : state.books.where((book) => book.bookGenre == event.genre).toList();
    emit(state.copyWith(books: filteredBooks));
  }

  Future<void> _searchBooks(SearchBooksEvent event, Emitter<FileManagerState> emit) async {
    final List<FileDataModel> filteredBooks = state.searchResults
        .where((book) => book.fileName.toLowerCase().contains(event.query.toLowerCase()))
        .toList();
    emit(state.copyWith(searchResults: filteredBooks));
  }
}

Future<FileStatusModel> getStatus(FileDataModel fileDataModel) async {
  final FileStatusModel fileStatusModel =
  await Isolate.run<FileStatusModel>(() async {
    return await FileManagerService.checkFile(fileDataModel);
  });
  return fileStatusModel;
}
