import 'package:test/test.dart';
import 'package:biblio_track/book.dart';
import 'package:biblio_track/user.dart';

void main() {
  group('User Tests', () {
    test('User initialization', () {
      // Create a user
      var user = User('Alice');
      
      // Check the user's name
      expect(user.name, equals('Alice'));
      // Check that the borrowed books list is empty
      expect(user.borrowedBooks, isEmpty);
    });

    test('Borrow an available book', () async {
      // Create a user and a book
      var user = User('Bob');
      var book = Book(title: '1984', author: 'George Orwell');

      // User borrows the book
      await user.borrowBook(book);

      // Verify that the book was borrowed
      expect(user.borrowedBooks, contains(book));
      expect(book.isAvailable, isFalse); // The book is no longer available
    });

    test('Return a borrowed book', () async {
      // Create a user and a book
      var user = User('Alice');
      var book = Book(title: '1984', author: 'George Orwell');

      // Borrow the book
      await user.borrowBook(book);

      // Return the book
      await user.returnBook(book);

      // Verify that the book was returned
      expect(user.borrowedBooks, isNot(contains(book)));
      expect(book.isAvailable, isTrue); // The book is available again
    });

    test('Cannot return a book that was not borrowed', () async {
      // Create a user and two books
      var user = User('Alice');
      var book1 = Book(title: '1984', author: 'George Orwell');
      var book2 = Book(title: 'The Little Prince', author: 'Antoine de Saint-Exupéry');

      // Borrow the first book
      await user.borrowBook(book1);

      // Attempt to return a book that was not borrowed (book2)
      await user.returnBook(book2);

      // Verify that book2 was not returned since it was never borrowed
      expect(user.borrowedBooks, contains(book1)); // Only book1 is in the list
      expect(user.borrowedBooks, isNot(contains(book2))); // book2 is not in the list
    });
  });

  // check for the user can't borrow more tha 3 books
  test('User can\'t borrow more than 3 books', () async {
    // Create a user and 4 books
    var user = User("Clemence");
    var book1 = Book(title: '1984', author: 'George Orwell');
    var book2 = Book(title: 'The Little Prince', author: 'Antoine de Saint-Exupéry');
    var book3 = Book(title: 'The Lord of the Rings', author: 'J.R.R. Tolkien');
    var book4 = Book(title: 'Harry Potter', author: 'J.K. Rowling');

    // Borrow 3 books
    await user.borrowBook(book1);
    await user.borrowBook(book2);
    await user.borrowBook(book3);

    // Try to borrow a 4th book
    await user.borrowBook(book4);

    // Verify that the 4th book was not borrowed
    expect(user.borrowedBooks, contains(book1));
    expect(user.borrowedBooks, contains(book2));
    expect(user.borrowedBooks, contains(book3));
    expect(user.borrowedBooks, isNot(contains(book4)));
  });
}
