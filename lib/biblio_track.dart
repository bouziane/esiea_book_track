import 'dart:async';

import 'package:biblio_track/library.dart';
import 'package:biblio_track/user.dart';
import 'book.dart';


Stream<String> borrowStream(Book book) async* {
  yield 'Demande d\'emprunt du livre "${book.title}" en cours...';
  if (!book.isAvailable) {
    yield 'Le livre "${book.title}" n\'est pas disponible.';
    return;
  }

  await Future.delayed(Duration(seconds: 2));
  book.isAvailable = false;
  book.log('emprunter le livre');
  yield 'Le livre "${book.title}" a été emprunté avec succès.';
}

void main() async {

  Library<Book> library = Library<Book>();

  Book book1 = Book(title: 'AHSOKA', author: 'E.K.Johnson');
  Book book2 = Book(title: 'A song of fire and ice', author: 'George R.R Martins');
  Book book3 = Book(title: 'Harry Potter', author: 'J.K Rowling');
  Book book4 = Book(title: 'To Kill a Mockingbird', author: 'Harper Lee');

  library.add(book1);
  library.add(book2);
  library.add(book3);
  library.add(book4);

  library.showAvailableBooks();

  User user = User();
  
  await for (String message in borrowStream(book1)) {
    print(message);
  }

  await user.borrowBook(book1);
  await user.borrowBook(book2);
  await user.borrowBook(book3);

  library.showAvailableBooks();
  user.showBorrowedBooks();
  await user.borrowBook(book4);

  library.showAvailableBooks();
  await book1.returnBook();
  await user.returnBook(book1);

  book1.showHistory();

  library.showAvailableBooks();
  user.showBorrowedBooks();
}
