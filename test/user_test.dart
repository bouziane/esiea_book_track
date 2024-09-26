import '../lib/book.dart';
import '../lib/user.dart';
import 'package:test/test.dart';

void main() {
  test('User should be able to borrow a book', () async {
    User user = User('Test User');
    Book book = Book('Book', 'Author', true, []);

    await user.borrowBook(book);

    expect(book.isAvailable, false);
    expect(user.borrowedBooks.length, 1);
  });
}