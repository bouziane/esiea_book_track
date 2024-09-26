import 'dart:async';
import 'history.dart';

class Book with History {
  String title;
  String? author;
  bool isAvailable;
  List<String> history;

  Book(this.title, this.author, this.isAvailable, this.history);
  
  // Méthode asynchrone pour emprunter un livre
  Future<void> borrow() async {
    if (isAvailable) {
      isAvailable = false;
      history.add('Borrowed');
    }
  }

  // Méthode asynchrone pour retourner un livre
  Future<void> returnBook() async {
    if (!isAvailable) {
      isAvailable = true;
      history.add('Returned');
    }
  }

}

extension UpperCaseTitle on Book {
  String get upperCaseTitle => title.toUpperCase();
}
