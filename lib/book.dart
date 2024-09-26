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
  Future<bool> borrow() async {
    if (isAvailable) {
      await Future.delayed(Duration(seconds: 2));
      isAvailable = false;
      log("Borrowed: ${title}");
      return true;
    } else {
      print("Tu ne pas emprunter \"${title}\" car il est déjà emprunté");
      return false;
    }
  }

  // Méthode asynchrone pour retourner un livre
  Future<bool> returnBook() async {
    if (!isAvailable) {
      await Future.delayed(Duration(seconds: 2));
      isAvailable = true;
      log("Returned: ${title}");
      return true;
    } else {
      print("Tu ne peux pas rendre \"${title}\" parce que tu ne l'as pas emprunté");
      return false;
    }
  }
}

extension UpperCaseTitle on Book {}
