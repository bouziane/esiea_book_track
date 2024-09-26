import 'package:biblio_track/book.dart';
import 'package:biblio_track/user.dart';

class UserTest {
  void runTests() {
    testBorrowBook();
  }

  void testBorrowBook() {

    Book book = Book(title: 'AHSOKA', author: 'E.K. Johnson');
    

    User user = User();
    

    user.borrowBook(book).then((_) {

      assert(book.isAvailable == false, 'Le livre dois etre emprunter');

      assert(user.borrowedBooks.contains(book), 'Le livre dois etre dans la liste de l\'user');

      print('Test réussi');
    }).catchError((error) {

      print('Erreur du test : $error');
    });
  }
}

void main() {

  UserTest userTest = UserTest();

  userTest.runTests();
}
