import 'package:test/test.dart';
import '../lib/book.dart';
import '../lib/user.dart';

void main() {
  group('User Borrow Book', () {
    test('User should be able to borrow a book', () async {
      var book = Book(title: '1984', author: 'George Orwell');
      var user = User('Alice');

      await user.borrowBook(book);

      expect(book.isAvailable, isFalse);
      expect(user.borrowedBooks.contains(book), isTrue);
      expect(book.history.contains('Borrowed by Alice: 1984'), isTrue);
    });

    test('User cannot borrow more than 3 books', () async {
      var book1 = Book(title: '1984', author: 'George Orwell');
      var book2 =
          Book(title: 'Le Petit Prince', author: 'Antoine de Saint-Exupéry');
      var book3 = Book(title: 'L\'Étranger', author: 'Albert Camus');
      var book4 = Book(title: 'Moby Dick', author: 'Herman Melville');
      var user = User('Alice');

      await user.borrowBook(book1);
      await user.borrowBook(book2);
      await user.borrowBook(book3);

      await user.borrowBook(book4);

      expect(user.borrowedBooks.contains(book4), isFalse);
      expect(user.borrowedBooks.length, equals(3));
      expect(user.history.length, equals(3));
      expect(book4.isAvailable, isTrue);
    });
  });
}
