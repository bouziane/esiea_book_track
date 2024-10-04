import 'package:biblio_track/book.dart';
import 'package:test/test.dart';

void main() {
  group('Book Tests', () {
    test('Book initialization', () {
      // Create a book
      var book = Book(title: '1984', author: 'George Orwell');

      // Check that the book title and author are correct
      expect(book.title, equals('1984'));
      expect(book.author, equals('George Orwell'));

      // Check that the book is available by default
      expect(book.isAvailable, isTrue);

      // Check that the book history is empty by default
      expect(book.history, isEmpty);
    });

    test('Borrowing a book', () async {
      // Create a book
      var book = Book(title: '1984', author: 'George Orwell');

      // Borrow the book
      await book.borrow();

      // Check that the book is no longer available
      expect(book.isAvailable, isFalse);

      // Check that borrowing action is logged in history
      expect(book.history.last, contains('borrowed'));
    });

    test('Returning a book', () async {
      // Create a book
      var book = Book(title: '1984', author: 'George Orwell');

      // Borrow the book first
      await book.borrow();

      // Return the book
      await book.returnBook();

      // Check that the book is available again
      expect(book.isAvailable, isTrue);

      // Check that returning action is logged in history
      expect(book.history.last, contains('returned'));
    });

    test('Logging actions', () {
      // Create a book
      var book = Book(title: '1984', author: 'George Orwell');

      // Log a custom action
      book.log('Checked condition');

      // Verify the action was logged
      expect(book.history.last, equals('Checked condition'));
    });

    test('Displaying history', () {
      // Create a book
      var book = Book(title: '1984', author: 'George Orwell');

      // Log some actions
      book.log('Checked condition');
      book.log('Book borrowed');
      book.log('Book returned');

      // Show history
      book.showHistory();

      // Verify that the history contains all logged actions
      expect(book.history, containsAll(['Checked condition', 'Book borrowed', 'Book returned']));
    });
  });
}
