import 'dart:async';
import 'package:biblio_track/book.dart';
import 'package:biblio_track/library.dart';

// Fonction pour gérer un Stream d'emprunt de livres
Stream<String> borrowStream(Book book) async* {
}

void main() async {
  Library lib = new Library<Book>();

  var livre1 = new Book(title: "Flutter pour les nuls", author: null, isAvailable: false);
  var livre2 = new Book(title: "Vie d'un pirate", author: "Barbe noire", isAvailable: false);

  lib.add(livre1);
  lib.add(livre2);

  lib.showAvailableBooks();

  await livre2.returnBook();
  await livre1.returnBook();

  lib.showAvailableBooks();

  livre2.showHistory();
  livre1.showHistory();

  await livre2.borrow();
  await livre1.borrow();

  lib.showAvailableBooks();

  livre2.showHistory();
  livre1.showHistory();
}