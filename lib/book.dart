import 'dart:async';
import 'package:biblio_track/history.dart';

class Book with History {
  String title;
  String? author;
  bool isAvailable;
  List<String>? history;

  // Méthode asynchrone pour emprunter un livre
  Future<void> borrow() async {
    if (isAvailable) {
      isAvailable = false;
      history?.add('Borrowed');
    }
  }

  // Méthode asynchrone pour retourner un livre
  Future<void> returnBook() async {
    if (!isAvailable) {
      isAvailable = true;
      history?.add('Returned');
    }
  }

  
}

extension UpperCaseTitle on Book {}
