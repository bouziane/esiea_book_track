import 'dart:async';
import 'package:biblio_track/history.dart';

class Book with History {
  String title;
  String? author;
  bool isAvailable = true;

  Book({required this.title, this.author});

  // Méthode asynchrone pour emprunter un livre
  Future<void> borrow() async {
    if (isAvailable) {
      isAvailable = false;
      log('[${DateTime.now().toIso8601String().substring(11, 19)}] Borrowed: "$title"');
      await Future.delayed(Duration(seconds: 5));
      // print('[${DateTime.now().toIso8601String().substring(11, 19)}] End of borrow: "$title"');
    } else {
      print('[${DateTime.now().toIso8601String().substring(11, 19)}] Book "$title" is already borrowed');
    }
  }

  Future<void> returnBook() async {
    if (!isAvailable) {
      isAvailable = true;
      log('[${DateTime.now().toIso8601String().substring(11, 19)}] Returned: "$title"');
      await Future.delayed(Duration(seconds: 5));
      // print('[${DateTime.now().toIso8601String().substring(11, 19)}] End of return: "$title"');
    } else {
      print('[${DateTime.now().toIso8601String().substring(11, 19)}] Book "$title" is already available');
    }
  }
}

extension UpperCaseTitle on Book {
  String get upperCaseTitle => title.toUpperCase();
}
