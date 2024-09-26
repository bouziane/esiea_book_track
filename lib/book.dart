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
    Future<bool> borrow() async {
        if (!isAvailable) {
            print("Book $title is already borrowed");
            return false;
        }

        await Future.delayed(Duration(seconds: 2));
        this.isAvailable = false;
        this.log("Borrowed: $title");
        return true;
    }

    // Méthode asynchrone pour retourner un livre
    Future<bool> returnBook() async {
        if (isAvailable) {
            print("Book $title is already returned");
            return false;
        }
        
        await Future.delayed(Duration(seconds: 2));
        this.isAvailable = true;
        this.log("Returned: $title");
        return true;
    }

}

extension UpperCaseTitle on Book {}
