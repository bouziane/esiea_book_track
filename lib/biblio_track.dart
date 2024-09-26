import 'dart:async';

import 'package:biblio_track/book.dart';
import 'package:biblio_track/library.dart';

void main() async {
    print("Library creation");
    Library library = new Library();
    library.add(Book("Eragon", "Christopher Paolini"));
    library.add(Book("Skyward", "Brandon Sanderson"));
    library.add(Book("Dune", "Frank Herbert"));
    library.showAvailableBooks();

    await for ( String response in borrowStream(library.resources[1]) ) {
        print(response);
    }

    library.showAvailableBooks();

    (library.resources[1] as Book).returnBook();

    library.showAvailableBooks();
}

// Fonction pour gérer un Stream d'emprunt de livres
Stream<String> borrowStream(Book book) async* {
    book.borrow();

    while (book.isAvailable) {
        await Future.delayed(Duration(seconds: 1));
        yield "Borrowing of ${book.title}";
    }

    yield "${book.title} borrowed !";
}
