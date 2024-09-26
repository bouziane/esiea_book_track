import 'package:biblio_track/book.dart';

class Library<T> {
  final List<T> resources = [];

  void add(T resource) {
    resources.add(resource);
  }

  void showAvailableBooks() {
    for (T resource in resources) {
      if (resource is Book && resource.isAvailable) {
        print(resource);
      }
    }
  }
}
