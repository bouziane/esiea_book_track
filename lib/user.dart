import 'package:biblio_track/book.dart';
import 'package:biblio_track/history.dart';

class User with History {
  List<Book> borrowedBooks = [];

  Future<void> borrowBook(Book book) async {
    bool alreadyHasBook = borrowedBooks.any((b) => b.title == book.title);
    if (alreadyHasBook) {
      print("Tu as déjà emprunté \"${book.title}\"");
    } else {
      if (borrowedBooks.length == 3) {
        print("Tu ne peux pas emprunter \"${book.title}\" car tu as déjà 3 livres");
      } else {
        bool canBeBorrowed = await book.borrow();
        if (canBeBorrowed) {
          borrowedBooks.add(book);
          log("L'utilisateur à emprunté \"${book.title}\"");
        }
      }
    }
  }

  Future<void> returnBook(Book book) async {
    bool canBeReturned = await book.returnBook();
    bool hasBook = borrowedBooks.any((b) => b.title == book.title);
    if (canBeReturned && hasBook) {
      borrowedBooks.remove(book);
      log("L'utilisateur à rendu \"${book.title}\"");
    }
  }

  void showBorrowedBooks() {
    for (Book b in borrowedBooks) {
      print("Livre : ${b.title}");
    }
  }
}