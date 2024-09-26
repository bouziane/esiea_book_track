import 'dart:async';
import 'package:biblio_track/book.dart';

class User {
  List<Book> borrowedBooks = [];

  Future<void> borrowBook(Book book) async {
    bool alreadyHasBook = borrowedBooks.any((b) => b.title == book.title);

    if (alreadyHasBook) {
      print("Tu as déjà emprunté \"${book.title}\"");
    } else {
      if (borrowedBooks.length >= 3) {
        print("Tu ne peux pas emprunter \"${book.title}\" car tu as déjà 3 livres.");
      } else {
        await book.borrow();
        borrowedBooks.add(book);
        print("Tu as emprunté \"${book.title}\".");
      }
    }
  }

  Future<void> returnBook(Book book) async {
    if (borrowedBooks.contains(book)) {
      await book.returnBook();
      borrowedBooks.remove(book);
      print("Tu as retourné \"${book.title}\".");
    } else {
      print("Tu n'as pas emprunté \"${book.title}\".");
    }
  }

  void showBorrowedBooks() {
    if (borrowedBooks.isEmpty) {
      print("Tu n'as emprunté aucun livre.");
    } else {
      print("Livres empruntés :");
      for (Book book in borrowedBooks) {
        print("- ${book.title} par ${book.author ?? "Auteur inconnu"}");
      }
    }
  }
}