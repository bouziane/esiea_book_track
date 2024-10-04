import 'package:biblio_track/book.dart';

class Library<T extends Book> {
  final List<T> _resources = [];
  List<T> get resources => _resources;

  void add(T resource) {
    _resources.add(resource);
    print('[${DateTime.now().toIso8601String().substring(11, 19)}] Added book to library: ${resource.title}');
  }

  void showAvailableBooks() {
    var availableBooks = _resources.where((book) => book.isAvailable).toList();

    if (availableBooks.isEmpty) {
      print('[${DateTime.now().toIso8601String().substring(11, 19)}] No books available');
    } else {
      print('[${DateTime.now().toIso8601String().substring(11, 19)}] Books available:');
      for (var book in availableBooks) {
        print('- ${book.title}');
      }
    }
  }
}

