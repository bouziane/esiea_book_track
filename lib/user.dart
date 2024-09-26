import 'book.dart';

class User {
  final String name;
  List<Book> borrowedBooks = [];

  User(this.name);

  Future<void> borrowBook(Book book) async {
    if (borrowedBooks.length >= 3) {
      print('Vous avez atteint la limite de 3 livres empruntés.');
    } else if (!book.isAvailable) {
      print('Le livre "${book.title}" n\'est pas disponible.');
    } else {
      borrowedBooks.add(book);
      await book.borrow(this);
      print('$name a emprunté le livre "${book.title}".');
    }
  }

  Future<void> returnBook(Book book) async {
    if (borrowedBooks.contains(book)) {
      borrowedBooks.remove(book);
      await book.returnBook(this);
      print('$name a retourné le livre "${book.title}".');
    } else {
      print('Le livre "${book.title}" n\'a pas été emprunté par $name.');
    }
  }

  void showBorrowedBooks() {
    print('Livres empruntés par $name :');
    for (var book in borrowedBooks) {
      print('- ${book.title} par ${book.author ?? 'Auteur inconnu'}');
    }
    if (borrowedBooks.isEmpty) {
      print('$name n\'a emprunté aucun livre.');
    }
  }
}
