import 'package:biblio_track/book.dart';
import 'package:biblio_track/library.dart';
import 'package:biblio_track/users.dart';
import 'package:test/test.dart';

void main() {
  // Vérifie que l'utilisateur à emprunté un livre 
  //=> que le livre est plus dispo 
  //=> qu'il est dans la list de livre du user

  test("When user borrow a book, book is unavailable", () async {
    // Given
    User user = User("Jean-luc");
    Book book = Book("Dart for 3yo", "Obi-wan Kenobi");

    // When
    await user.borrow(book);

    // Then
    expect(book.isAvailable, false);
  });
  
  test("When user borrow a book, book is the user's list", () async {
    // Given
    User user = User("Jean-luc");
    Book book = Book("Dart for 3yo", "Obi-wan Kenobi");

    // When
    await user.borrow(book);

    // Then
    expect(user.books.contains(book), true);
  });
}