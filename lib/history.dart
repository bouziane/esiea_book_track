mixin History {
  List<String> history = [];

  void log(String action) {
    history.add(action);
  }

  void showHistory() {
    print("Historique :");
    for (String action in history) {
      print(action);
    } 
  }
}
