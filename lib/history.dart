mixin History {
  List<String> history = [];

  void log(String action) {
    history.add(action);
  }

  void showHistory() {
    if (history.isEmpty) {
      print('Pas d\'action .');
    } else {
      print('liste des actions :');
      for (var entry in history) {
        print(entry);
      }
    }
  }
}
