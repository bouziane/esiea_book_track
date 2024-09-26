import 'package:biblio_track/book.dart';

class Library<T> {
  List<T> resources = [];

  void add(T resource) {
    resources.add(resource);
    print('ressource ajouté.');
  }

  void showAvailableBooks() {
    print('livres disponibles :');
    for (var resource in resources) {
      if (resource is Book && resource.isAvailable) {
        print('- ${resource.title} par ${resource.author}');
      }
    }
  }
}