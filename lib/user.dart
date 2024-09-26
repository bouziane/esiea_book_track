import 'book.dart';
import 'history.dart';

class User with History{
  String name;
  List<Book> borrowedBooks = [];

  User(this.name);

  Future<void> borrowBook(Book book) async {
    if (borrowedBooks.length >= 3) {
      print('$name cannot borrow more than 3 books.');
      return;
    }
    if (book.isAvailable) {
      await book.borrow();
      borrowedBooks.add(book);
      log('Borrowed : ${book.title}');
    } else {
      print('${book.title} is not available');
    }
  }

  Future<void> returnBook(Book book) async {
    if (borrowedBooks.contains(book)) {
      await book.returnBook();
      borrowedBooks.remove(book);
      log('Returned : ${book.title}');
    } else {
      print('$name does not have ${book.title}');
    }
  }

  void showBorrowedBooks() {
    print('Borrowed books by $name :');
    for (var book in borrowedBooks) {
      print('- ${book.title}');
    }
  }

  void showUserHistory() {
    print('User history for $name :');
    showHistory();
  }
}
