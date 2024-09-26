import 'dart:async';
import 'book.dart';
import 'library.dart';

// Fonction pour gérer un Stream d'emprunt de livres
Stream<String> borrowStream(Book book) async* {
  await book.borrow();
  print('Borrowed ${book.title}');
}

void main() {
  var library = Library<Book>();
  var book = Book('One Piece', 'Eiichiro Oda', true, []);
  library.add(book);
  library.showAvailableBooks();
  var stream = borrowStream(book);
  stream.listen((event) {
    print(event);
  });
  book.returnBook();
  print('Returned ${book.title}');
  book.showHistory();
}
