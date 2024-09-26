import 'dart:async';
import 'history.dart';
import 'user.dart';

class Book with History {
  final String title;
  final String? author;
  bool isAvailable;

  Book({required this.title, this.author, this.isAvailable = true});

  // Méthode asynchrone pour emprunter un livre
  Future<void> borrow(User user) async {
    if (isAvailable) {
      isAvailable = false;
      log('Borrowed by ${user.name}: $title');
      user.log("${user.name} borrwed $title");
      await Future.delayed(Duration(seconds: 2)); // Simule un délai
      print('Vous avez emprunté le livre : $title');
    } else {
      print('Le livre "$title" est déjà emprunté.');
    }
  }

  // Méthode asynchrone pour retourner un livre
  Future<void> returnBook(User user) async {
    if (!isAvailable) {
      isAvailable = true;
      log('Returned by ${user.name}: $title');
      user.log("${user.name} returned $title");
      await Future.delayed(Duration(seconds: 2)); // Simule un délai
      print('Vous avez retourné le livre : $title');
    } else {
      print('Le livre "$title" n\'a pas été emprunté.');
    }
  }
}

extension UpperCaseTitle on Book {}
