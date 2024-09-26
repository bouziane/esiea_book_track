import 'dart:async';
import 'package:biblio_track/book.dart';
import 'package:biblio_track/library.dart';
import 'package:biblio_track/user.dart';

// Fonction pour gérer un Stream d'emprunt de livres
Stream<String> borrowStream(Book book) async* {
}

void main() async {
  Library lib = new Library<Book>();
  User u = new User();

  Book livre1 = new Book(title: "The Little Prince", author: "Antoine de Saint-Exupéry", isAvailable: true);
  Book livre2 = new Book(title: "Flutter pour les nuls", author: null, isAvailable: true);
  Book livre3 = new Book(title: "Le tour du monde en 80 jours", author: "Jules Verne", isAvailable: true);
  Book livre4 = new Book(title: "L'encyclopédie du savoir relatif et absolue", author: "Bernard Werber", isAvailable: true);

  lib.add(livre1);
  lib.add(livre2);
  lib.add(livre3);
  lib.add(livre4);

  lib.showAvailableBooks();

  print("--------------------");

  u.showBorrowedBooks();

  print("--------------------");

  await u.borrowBook(livre1);
  await u.borrowBook(livre1);
  await u.borrowBook(livre2);
  await u.borrowBook(livre3);
  await u.borrowBook(livre4);

  lib.showAvailableBooks();

  print("--------------------");

  await u.returnBook(livre1);
  await u.returnBook(livre2);
  await u.returnBook(livre3);
  await u.returnBook(livre4);

  lib.showAvailableBooks();

  print("--------------------");

  livre1.showHistory();

  print("--------------------");

  u.showBorrowedBooks();

  print("--------------------");

  u.showHistory();

}