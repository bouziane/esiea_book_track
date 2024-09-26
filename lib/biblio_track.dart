import 'dart:async';
import 'book.dart';
import 'library.dart';

// Fonction pour gérer un Stream d'emprunt de livres
Stream<String> borrowStream(Book book) async* {}

void main() async {
  var library = Library<Book>();
  var book = Book('One Piece', 'Eiichiro Oda', true, []);
  var book2 = Book('Naruto', 'Masashi Kishimoto', true, []);
  library.add(book);
  library.add(book2);
  library.showAvailableBooks();

  book.borrow();
  book.returnBook();
  book.showHistory();

  book2.borrow();
  book2.returnBook();
  book2.showHistory();
}
