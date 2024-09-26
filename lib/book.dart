import 'dart:async';
import 'package:biblio_track/history.dart';

class Book with History {
    String title = "Titre";
    String? author;
    bool isAvailable = true; 
    

    Book(String title, String? author) {
        this.title = title;
        this.author = author;
    }

    // Méthode asynchrone pour emprunter un livre
    Future<void> borrow() async {
        if (!isAvailable) {
            print("Book $title is already borrowed");
            return;
        }

        await Future.delayed(Duration(seconds: 2));
        this.isAvailable = false;
        this.log("Borrowed: $title");
    }

    // Méthode asynchrone pour retourner un livre
    Future<void> returnBook() async {
        if (isAvailable) {
            print("Book $title is already returned");
            return;
        }
        
        await Future.delayed(Duration(seconds: 2));
        this.isAvailable = true;
        this.log("Returned: $title");
    }

}

extension UpperCaseTitle on Book {}
