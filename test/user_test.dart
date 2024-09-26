import 'package:test/test.dart';
import 'package:biblio_track/book.dart';
import 'package:biblio_track/user.dart';

void main() {
  group('User Tests', () {
    test('User should be able to borrow a book', () async {
      Book book = Book(title: 'AHSOKA', author: 'E.K. Johnson');
      
      User user = User();
      
      await user.borrowBook(book);
      
      expect(book.isAvailable, isFalse, reason: 'Le livre devrait être marqué comme emprunté.');
      
      expect(user.borrowedBooks.contains(book), isTrue, reason: 'Le livre devrait être dans la liste des livres empruntés par l\'utilisateur.');
    });

    test('Book should not be borrowed twice by the same user', () async {

      Book book = Book(title: 'Harry Potter', author: 'J.K. Rowling');

      User user = User();

      await user.borrowBook(book);

      await user.borrowBook(book);

      expect(user.borrowedBooks.length, equals(1), reason: 'L\'utilisateur ne devrait pas pouvoir emprunter deux fois le même livre.');
    });

    test('User cannot borrow more than 3 books', () async {

      Book book1 = Book(title: 'AHSOKA', author: 'E.K. Johnson');
      Book book2 = Book(title: 'A Song of Fire and Ice', author: 'George R.R. Martin');
      Book book3 = Book(title: 'Harry Potter', author: 'J.K. Rowling');
      Book book4 = Book(title: 'To Kill a Mockingbird', author: 'Harper Lee');
      
      User user = User();
      
      await user.borrowBook(book1);
      await user.borrowBook(book2);
      await user.borrowBook(book3);
      
      await user.borrowBook(book4);
      
      expect(user.borrowedBooks.length, equals(3), reason: 'L\'utilisateur ne devrait pas pouvoir emprunter plus de 3 livres.');
    });
  });
}
