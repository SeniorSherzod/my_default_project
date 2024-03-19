import '../models/book_model/book_model.dart';
import '../models/network_responce.dart';
import '../network/api_provider.dart';

class BookRepo {
  Future<MyResponse> getAllBooks() => ApiProvider.getAllBooks();

  Future<MyResponse> addBook(BookModel bookModel) =>
      ApiProvider.addBook(bookModel);

  Future<MyResponse> deleteBook(String bookUUID) =>
      ApiProvider.deleteBook(bookUUID);

  Future<MyResponse> updateBook(BookModel bookModel) =>
      ApiProvider.updateBook(bookModel);
}