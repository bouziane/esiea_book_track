import 'dart:async';
import 'package:biblio_track/history.dart';


class Book with History {
  //TODO: Ajouter ici les propriétés d'un livre
  String title;
  String? author;
  bool isAvailable;


  Book({
    required this.title,
    this.author,
    this.isAvailable = true,
  });

  // Méthode asynchrone pour emprunter un livre
  Future<void> borrow() async {
    if (!isAvailable){
      print('Le livre "$title" est déjà emprunté.');
      return;
    }
    await Future.delayed(Duration(seconds: 2));
    isAvailable = false;
    log('emprun effectué');
    print('le livre "$title" est emprunté');
  }

  // Méthode asynchrone pour retourner un livre
  Future<void> returnBook() async {
       if (isAvailable) {
      print('Le livre "$title" est déjà disponible.');
      return;
    }
    await Future.delayed(Duration(seconds: 2));
    isAvailable = true;
    log('livre retourner');
    print('le livre "$title" a été retourner');
  }
}


extension UpperCaseTitle on Book {}
