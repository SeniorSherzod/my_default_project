part of 'file_manager_bloc.dart';

abstract class FileManagerEvent extends Equatable {
  const FileManagerEvent();
}

class DownloadFileEvent extends FileManagerEvent {
  final FileDataModel fileDataModel;

  const DownloadFileEvent({
    required this.fileDataModel,
  });

  @override
  List<Object?> get props => [fileDataModel];
}
class CategoryBooksEvent extends FileManagerEvent {
  final String genre;

  const CategoryBooksEvent({
    required this.genre,
  });

  @override
  List<Object?> get props => [genre];
}

class SearchBooksEvent extends FileManagerEvent {
  final String query;

  const SearchBooksEvent({
    required this.query,
  });

  @override
  List<Object?> get props => [query];
}
