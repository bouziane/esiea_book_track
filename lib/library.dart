import 'book.dart';

class Library<T> {
  List<T> resources = [];

  void add(T resource) {
    resources.add(resource);
  }

  void showAvailableBooks() {
    print('Livres disponibles :');
    for (var resource in resources) {
      if (resource is Book && resource.isAvailable) {
        print('- ${resource.title} par ${resource.author ?? "Auteur inconnu"}');
      }
    }
  }
}
