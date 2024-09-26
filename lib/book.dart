import 'dart:async';
import 'package:biblio_track/history.dart';

class Book with History {
  //TODO: Ajouter ici les propriétés d'un livre
  String title;
  String? author;
  bool isAvailable;
  List<String> history = [];

  Book({
    required this.title,
    this.isAvailable = true
  });

  // Méthode asynchrone pour emprunter un livre
  Future<void> borrow() async {
    await Future.delayed(Duration(seconds: 2));
  }

  // Méthode asynchrone pour retourner un livre
  Future<void> returnBook() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  void log(String action) {
    this.history.add(action);
  }

  @override
  void showHistory() {
    print(this.history);
  }
}

extension UpperCaseTitle on Book {}
