import 'dart:async';
import 'book.dart';
import 'library.dart';

// Fonction pour gérer un Stream d'emprunt de livres
Stream<String> borrowStream(Book book) async* {}

void main() async {
  var library = Library<Book>();

  var book1 = Book(title: '1984', author: 'George Orwell');
  var book2 =
      Book(title: 'Le Petit Prince', author: 'Antoine de Saint-Exupéry');
  var book3 = Book(title: 'L\'Étranger', author: 'Albert Camus');

  library.add(book1);
  library.add(book2);
  library.add(book3);

  library.showAvailableBooks();

  await book1.borrow();
  library.showAvailableBooks();

  await book1.returnBook();
  library.showAvailableBooks();

  book1.showHistory();
}
