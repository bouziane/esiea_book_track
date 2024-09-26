import 'dart:async';

import 'package:biblio_track/library.dart';

import 'book.dart';


Stream<String> borrowStream(Book book) async* {
  yield 'Demande d\'emprunt du livre "${book.title}" en cours...';
  if (!book.isAvailable) {
    yield 'Le livre "${book.title}" n\'est pas disponible.';
    return;
  }

  await Future.delayed(Duration(seconds: 2));
  book.isAvailable = false;
  book.log('emprunté le livre');
  yield 'Le livre "${book.title}" a été emprunté avec succès.';
}

void main() async {

  Library<Book> library = Library<Book>();

  Book book1 = Book(title: 'AHSOKA', author: 'E.K.Johnson');
  Book book2 = Book(title: 'A song of fire and ice', author: 'George R.R Martins');
  Book book3 = Book(title: 'Harry Potter', author: 'J.K Rowling');

  library.add(book1);
  library.add(book2);
  library.add(book3);

  library.showAvailableBooks();

  await for (String message in borrowStream(book1)) {
    print(message);
  }

  library.showAvailableBooks();

  await book1.returnBook();

  book1.showHistory();

  library.showAvailableBooks();
}
