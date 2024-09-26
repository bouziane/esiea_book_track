import 'package:biblio_track/book.dart';

class Library<T> {
    List<T> resources = [];

    Library() {}

    void add(T resource) {
        this.resources.add(resource);
    }

    void showAvailableBooks() {
        print("Availables books : ");
        this.resources
            .where((book) => book is Book && book.isAvailable)
            .forEach((book) => print(" - ${(book as Book).title}, by ${(book as Book).author}") );
    }
}
