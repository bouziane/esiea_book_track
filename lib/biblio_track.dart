import 'dart:async';
import 'dart:developer';

import 'package:biblio_track/book.dart';
import 'package:biblio_track/library.dart';
import 'package:biblio_track/users.dart';

void main() async {
    print("\nLibrary creation");
    
    // Init library
    Library library = new Library();
    library.add(Book("Eragon", "Christopher Paolini"));
    library.add(Book("Skyward", "Brandon Sanderson"));
    library.add(Book("Dune", "Frank Herbert"));
    library.add(Book("Idéalis", "Christopher Paolini"));
    library.add(Book("Oxcean", "Nicolas Michel"));
    library.showAvailableBooks();

    // Init users
    User u1 = User("Arya");
    User u2 = User("Orik");

    u1.showUserBooks();

    for (var i = 0; i < 4; i++) {
        await for ( String response in borrowStream(u1, library.resources[i]) ) {
            print(response);
        }
    }

    await for ( String response in borrowStream(u2, library.resources[1]) ) {
        print(response);
    }

    u1.showUserBooks();
    u2.showUserBooks();

    library.showAvailableBooks();

    await (library.resources[1] as Book).returnBook();

    library.showAvailableBooks();

    (library.resources[1] as Book).showHistory();
}

// Fonction pour gérer un Stream d'emprunt de livres
Stream<String> borrowStream(User user, Book book) async* {
    Future<bool> success = user.borrow(book);

    while (book.isAvailable && !user.reachLimit ) {
        await Future.delayed(Duration(seconds: 1));
        yield "${user.name} is borrowing ${book.title} ...";
    }

    if (await success) {
        yield "${book.title} borrowed by ${user.name} !";
    }
}
