import 'package:biblio_track/book.dart';

class User {
    String name = "user";
    List<Book> books = [];
    bool reachLimit = false;

    User(String name) {
        this.name = name;
    }

    Future<bool> borrow(Book book) async {
        if (this.books.length >= 3) {
            print("User $name has reached his borrowing limit, and can't borrow ${book.title} !");
            this.reachLimit = true;
            return false;
        }
        if (! await book.borrow() ) {
            return false;
        }

        this.books.add(book);
        return true;
    }

    void showUserBooks() {
        print("Books borrowed by $name : ");
        this.books.forEach((book) => print(" * ${book.title}, by ${book.author}") );
    }
}