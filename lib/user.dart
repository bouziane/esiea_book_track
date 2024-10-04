import 'book.dart';

class User {
  String name;
  List<Book> borrowedBooks = [];

  User(this.name);

  Future<void> borrowBook(Book book) async {
    if (borrowedBooks.length >= 3) {
      print('[${DateTime.now().toIso8601String().substring(11, 19)}] $name can\'t borrow more than 3 books');
      return;
    }
    if (book.isAvailable) {
      await book.borrow();
      borrowedBooks.add(book);
      print('[${DateTime.now().toIso8601String().substring(11, 19)}] $name borrowed the book "${book.title}"');
    } else {
      print('[${DateTime.now().toIso8601String().substring(11, 19)}] Sorry, the book "${book.title}" isn\'t available.');
    }
  }

  Future<void> returnBook(Book book) async {
    if (borrowedBooks.contains(book)) {
      await book.returnBook();
      borrowedBooks.remove(book);
      print('[${DateTime.now().toIso8601String().substring(11, 19)}] $name returned the book "${book.title}"');
    } else {
      print('[${DateTime.now().toIso8601String().substring(11, 19)}] $name doesn\'t have the book "${book.title}" to return');
    }
  }

  void showBorrowedBooks() {
    if (borrowedBooks.isEmpty) {
      print('[${DateTime.now().toIso8601String().substring(11, 19)}] $name hasn\'t borrowed any books yet');
    } else {
      print('[${DateTime.now().toIso8601String().substring(11, 19)}] $name has borrowed the following books:');
      for (var book in borrowedBooks) {
        print('- ${book.title}');
      }
    }
  }
}
