mixin History {
  List<String> history = [];

  void log(String action) {
    history.add(action);
  }

  void showHistory() {
    for (String action in history) {
      print(action);
    } 
  }
}
