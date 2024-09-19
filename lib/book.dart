import 'dart:async';
import 'package:biblio_track/history.dart';

class Book with History {
  //TODO: Ajouter ici les propriétés d'un livre

  // Méthode asynchrone pour emprunter un livre
  Future<void> borrow() async {}

  // Méthode asynchrone pour retourner un livre
  Future<void> returnBook() async {}
}

extension UpperCaseTitle on Book {}
