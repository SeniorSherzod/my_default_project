part of 'file_manager_bloc.dart';

class FileManagerState extends Equatable {
  const FileManagerState({
    required this.progress,
    required this.newFileLocation,
    required this.books,
    required this.searchResults,
  });

  final double progress;
  final String newFileLocation;
  final List<FileDataModel> books;
  final List<FileDataModel> searchResults;

  FileManagerState copyWith({
    double? progress,
    String? newFileLocation,
    List<FileDataModel>? books,
    List<FileDataModel>? searchResults,
  }) =>
      FileManagerState(
        progress: progress ?? this.progress,
        newFileLocation: newFileLocation ?? this.newFileLocation,
        books: books ?? this.books,
        searchResults: searchResults ?? this.searchResults,
      );

  @override
  List<Object?> get props => [
    progress,
    newFileLocation,
    books,
    searchResults,
  ];
}
