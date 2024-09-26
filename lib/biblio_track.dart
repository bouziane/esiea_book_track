import 'dart:async';
import 'book.dart';
import 'library.dart';
import 'user.dart';

// Fonction pour gérer un Stream d'emprunt de livres
Stream<String> borrowStream(Book book) async* {}

void main() async {
  var library = Library<Book>();

  var book1 = Book(title: '1984', author: 'George Orwell');
  var book2 =
      Book(title: 'Le Petit Prince', author: 'Antoine de Saint-Exupéry');
  var book3 = Book(title: 'L\'Étranger', author: 'Albert Camus');
  var book4 = Book(title: 'Moby Dick', author: 'Herman Melville');

  library.add(book1);
  library.add(book2);
  library.add(book3);
  library.add(book4);

  var user = User('Alice');

  library.showAvailableBooks();

  await user.borrowBook(book1);
  await user.borrowBook(book2);
  await user.borrowBook(book3);
  await user.borrowBook(book4);

  user.showBorrowedBooks();
  await user.returnBook(book1);
  user.showBorrowedBooks();

  library.showAvailableBooks();

  book1.showHistory();
  book2.showHistory();
  book3.showHistory();
  book4.showHistory();

  user.showHistory();
}
