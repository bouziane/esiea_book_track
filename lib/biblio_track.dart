import 'dart:async';
import 'book.dart';
import 'library.dart';
import 'user.dart';

// Fonction pour gérer un Stream d'emprunt de livres
Stream<String> borrowStream(Book book) async* {}

void main() async {
  var library = Library<Book>();
  var book1 = Book('One Piece', 'Eiichiro Oda', true, []);
  var book2 = Book('Naruto', 'Masashi Kishimoto', true, []);
  var book3 = Book('Dragon Ball', 'Akira Toriyama', true, []);
  var book4 = Book('Bleach', 'Tite Kubo', true, []);
  library.add(book1);
  library.add(book2);
  library.showAvailableBooks();

  print("----");

  book1.borrow();
  book1.returnBook();
  book1.showHistory();

  book2.borrow();
  book2.returnBook();
  book2.showHistory();

  print("----");

  var user = User('Yoshi');

  await user.borrowBook(book1);
  await user.borrowBook(book2);
  await user.borrowBook(book3);
  await user.borrowBook(book4);

  user.showBorrowedBooks();
  await user.returnBook(book1);
  user.showBorrowedBooks();
  user.showUserHistory();
}
