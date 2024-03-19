import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../data/models/book_model/book_model.dart';
import '../data/models/network_responce.dart';
import '../data/repository/book_repository.dart';

class BookViewModel extends ChangeNotifier {
  List<BookModel> allBooks = [];

  String statusText = "";

  bool isLoading = false;

  BookViewModel({required this.productRepo});

  final BookRepo productRepo;

  Future<void> getAllBooks() async {
    _notify(true);
    MyResponse myResponse = await productRepo.getAllBooks();
    _notify(false);
    if (myResponse.errorText.isEmpty) {
      allBooks = myResponse.data as List<BookModel>;
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> addBook(BookModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await productRepo.addBook(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> updateBook(BookModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await productRepo.updateBook(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> deleteBook(String bookUUID) async {
    _notify(true);
    MyResponse myResponse = await productRepo.deleteBook(bookUUID);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  _notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}