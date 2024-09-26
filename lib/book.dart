import 'dart:async';
import 'package:biblio_track/history.dart';

class Book with History {
  String title;
  String? author;
  bool isAvailable;

  Book({
    required this.title,
    this.author,
    this.isAvailable = true
  });

  // Méthode asynchrone pour emprunter un livre
  Future<void> borrow() async {
    if (isAvailable) {
      await Future.delayed(Duration(seconds: 2));
      isAvailable = false;
    } else {
      print("Le livre ne peut pas être pris");
    }
  }

  // Méthode asynchrone pour retourner un livre
  Future<void> returnBook() async {
    if (!isAvailable) {
      await Future.delayed(Duration(seconds: 2));
      isAvailable = false;
    } else {
      print("Le livre n'est pas emprunté");
    }
  }
}

extension UpperCaseTitle on Book {}
