import 'book.dart';

class Library<T> {
  List<T> resources = [];

  void add(T resource) {
    if (resource is Book) {
      resources.add(resource);
      print('Added ${resource.title} by ${resource.author}');
    }
  }

  void showAvailableBooks() {
    print('Available books :');
    for (var resource in resources) {
      if (resource is Book) {
        if (resource.isAvailable) {
          print('- ${resource.title}');
        }
      }
    }
  }
}
