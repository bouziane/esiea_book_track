import 'package:biblio_track/book.dart';
import 'package:biblio_track/user.dart';
import 'package:test/test.dart';

void main() {  
  late User user;
  late Book book1;

  group("User", () {
    test("should have book \"The Little Prince\" in his borrowedBooks and isAvailable should be false", () async {
      user = new User();
      book1 = new Book(title: "The Little Prince", author: "Antoine de Saint-Exupéry", isAvailable: true);

      await user.borrowBook(book1);

      expect(user.borrowedBooks.length, equals(1));
      expect(book1.isAvailable, equals(false));
    });

    test("should return book, borrowedBooks should be empty and book should be available", () async {
      user = new User();
      book1 = new Book(title: "The Little Prince", author: "Antoine de Saint-Exupéry", isAvailable: false);
      user.borrowedBooks.add(book1);

      await user.returnBook(book1);

      expect(user.borrowedBooks.length, equals(0));
      expect(book1.isAvailable, equals(true));
    });
  });
}