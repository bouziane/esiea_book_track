import '../lib/book.dart';
import '../lib/user.dart';

void main() async {
  void userHasBook(bool state, bool expected, String message) {
    if (state != expected) {
      print('Error: $message\nExpected: $expected\nActual: $state');
    }
  }

  void bookAvailable(List<Book> userList, Book book, String message) {
    if (!userList.contains(book)) {
      print('Error: $message\nList does not contain: $book');
    }
  }

  void unitTests() async {
    User user = User('Test User');
    Book book = Book('Book', 'Author', true, []);

    await user.borrowBook(book);

    userHasBook(book.isAvailable, false, 'Book should not be available');
    bookAvailable(user.borrowedBooks, book, 'User should have borrowed Book');
  }

  try {
    unitTests();
    print('Successful');
  } catch (e) {
    print(e);
  }
}