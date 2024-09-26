import 'package:biblio_track/book.dart';

class Library<T> {
  final List<T> resources = [];

  void add(T resource) {
    resources.add(resource);
  }

  void showAvailableBooks() {
    print(resources);
  }
}
