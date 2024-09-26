mixin History {
    List<String> history = [];

    void log(String action) {
        history.add(action);
    }

    void showHistory() {
        print("Logs: $history");
    }
}
