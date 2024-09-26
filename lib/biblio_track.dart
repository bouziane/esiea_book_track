import 'dart:async';
import 'book.dart';
import 'library.dart';

// Fonction pour gérer un Stream d'emprunt de livres
Stream<String> borrowStream(Book book) async* {
  await book.borrow();
  book.log('Borrowed : ${book.title}');
}

void main() {
  var library = Library<Book>();
  var book = Book('One Piece', 'Eiichiro Oda', true, []);
  var book2 = Book('Naruto', 'Masashi Kishimoto', true, []);
  library.add(book);
  library.add(book2);
  library.showAvailableBooks();
  var stream = borrowStream(book);
  stream.listen((event) {
    print(event);
  });
  book.returnBook();
  book.log('Returned : ${book.title}');
  book.showHistory();
}
