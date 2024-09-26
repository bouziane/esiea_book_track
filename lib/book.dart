import 'dart:async';
import 'history.dart';

class Book with History {
  final String title;
  final String? author;
  bool isAvailable;

  Book({required this.title, this.author, this.isAvailable = true});

  // Méthode asynchrone pour emprunter un livre
  Future<void> borrow() async {
    if (isAvailable) {
      isAvailable = false;
      log('Le livre "$title" a été emprunté.');
      await Future.delayed(Duration(seconds: 2)); // Simule un délai
      print('Vous avez emprunté le livre : $title');
    } else {
      print('Le livre "$title" est déjà emprunté.');
    }
  }

  // Méthode asynchrone pour retourner un livre
  Future<void> returnBook() async {
    if (!isAvailable) {
      isAvailable = true;
      log('Le livre "$title" a été retourné.');
      await Future.delayed(Duration(seconds: 2)); // Simule un délai
      print('Vous avez retourné le livre : $title');
    } else {
      print('Le livre "$title" n\'a pas été emprunté.');
    }
  }
}

extension UpperCaseTitle on Book {}
