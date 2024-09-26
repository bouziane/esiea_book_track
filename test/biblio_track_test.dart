import 'package:test/test.dart';
import 'package:biblio_track/book.dart';
import 'package:biblio_track/biblio_track.dart';

void main() {
  group('Book Borrowing Stream Tests', () {
    test('Borrowing a book emits a borrowed message', () async {
      // Create a book
      var book = Book(title: '1984', author: 'George Orwell');

      // Create a stream for borrowing the book
      var stream = borrowStream(book);

      // Expect the first emitted value to contain 'Borrowed'
      expect(await stream.first, contains('Borrowed'));

      // After borrowing, check if the book is not available
      expect(book.isAvailable, isFalse);
    });

    test('Returning a book emits a returned message', () async {
      // Create a book
      var book = Book(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald');

      // Borrow the book first
      await book.borrow();

      // Create a stream for returning the book
      var stream = borrowStream(book);

      // Expect the last emitted value to contain 'Returned'
      expect(await stream.last, contains('Returned'));

      // After returning, check if the book is available again
      await book.returnBook(); // Return the book
      expect(book.isAvailable, isTrue);
    });

    test('Borrowing a book updates the history', () async {
      // Create a book
      var book = Book(title: 'Fahrenheit 451', author: 'Ray Bradbury');

      // Borrow the book
      await book.borrow();

      // Check the history
      expect(book.history, contains('Book borrowed: Fahrenheit 451'));
    });

    test('Returning a book updates the history', () async {
      // Create a book
      var book = Book(title: 'To Kill a Mockingbird', author: 'Harper Lee');

      // Borrow and return the book
      await book.borrow();
      await book.returnBook();

      // Check the history
      expect(book.history, contains('Book returned: To Kill a Mockingbird'));
    });
  });
}
