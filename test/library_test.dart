import 'package:test/test.dart';
import 'package:biblio_track/book.dart';
import 'package:biblio_track/library.dart';
import 'dart:async';

void main() {
  group('Library Tests', () {
    
    test('Add books to library', () {
      // Create a library
      var library = Library<Book>();

      // Create books
      var book1 = Book(title: '1984', author: 'George Orwell');
      var book2 = Book(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald');

      // Add books to the library
      library.add(book1);
      library.add(book2);

      // Check that both books are in the library
      expect(library.resources, containsAll([book1, book2]));
    });

    test('Show available books - with books available', () async {
      // Create a library
      var library = Library<Book>();

      // Create books
      var book1 = Book(title: '1984', author: 'George Orwell');
      var book2 = Book(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald');

      // Add books to the library
      library.add(book1);
      library.add(book2);

      // Borrow one book
      await book1.borrow();

      // Capture printed output
      var printedOutput = await _capturePrint(() {
        library.showAvailableBooks();
      });

      // Verify that only book2 is printed as available
      expect(printedOutput, contains('Books available:'));
      expect(printedOutput, contains('- The Great Gatsby'));
      expect(printedOutput, isNot(contains('- 1984')));
    });

    test('Show available books - no books available', () async {
      // Create a library
      var library = Library<Book>();

      // Create books
      var book1 = Book(title: '1984', author: 'George Orwell');
      var book2 = Book(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald');

      // Add books to the library
      library.add(book1);
      library.add(book2);

      // Borrow both books
      await book1.borrow();
      await book2.borrow();

      // Capture printed output
      var printedOutput = await _capturePrint(() {
        library.showAvailableBooks();
      });

      // Verify that no books are available
      expect(printedOutput, contains('No books available'));
    });
  });
}

// Helper function to capture print statements during a test
Future<String> _capturePrint(Function() testFunction) async {
  var buffer = StringBuffer();
  var spec = ZoneSpecification(print: (self, parent, zone, message) {
    buffer.writeln(message);
  });

  await Zone.current.fork(specification: spec).run(() async {
    testFunction();
  });

  return buffer.toString();
}
