import 'dart:async';
import 'book.dart';
import 'library.dart';
import 'user.dart';

String getFormattedTime() => DateTime.now().toIso8601String().substring(11, 19);

// Fonction pour gérer un Stream d'emprunt de livres
Stream<String> borrowStream(Book book) async* {
  yield '[${getFormattedTime()}] Asking for "${book.title}"...';

  await book.borrow();

  yield '[${getFormattedTime()}] "${book.title}" borrowed';
}

Future<void> run() async {
  var library = Library<Book>();

  var book1 = Book(title: '1984', author: 'George Orwell');
  var book2 = Book(title: 'Le Petit Prince', author: 'Antoine de Saint-Exupéry');
  var book3 = Book(title: 'Le Seigneur des Anneaux', author: 'J.R.R. Tolkien');
  var book4 = Book(title: 'Harry Potter', author: 'J.K. Rowling');
  var book5 = Book(title: 'Le Rouge et le Noir', author: 'Stendhal');

  library.add(book1);
  library.add(book2);
  library.add(book3);
  library.add(book4);
  library.add(book5);

  var user1 = User('Alice');
  var user2 = User('Bob');

  library.showAvailableBooks();

  var borrowStreamBook1 = borrowStream(book1);

  await for (var event in borrowStreamBook1) {
    print(event);
  }

  library.showAvailableBooks();

  book1.showHistory();
  book1.returnBook();
  book1.showHistory();

  library.showAvailableBooks();
}
