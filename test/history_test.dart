import 'dart:async';

import 'package:test/test.dart';
import 'package:biblio_track/history.dart';

class MockHistory with History {}

void main() {
  group('History Mixin Tests', () {
    test('Log actions and show history', () {
      // Create an instance of a class using the History mixin
      var mockHistory = MockHistory();

      // Log actions
      mockHistory.log('Book borrowed');
      mockHistory.log('Book returned');

      // Check if the actions are correctly logged
      expect(mockHistory.history.length, equals(2));
      expect(mockHistory.history, contains('Book borrowed'));
      expect(mockHistory.history, contains('Book returned'));
    });

    test('Show history prints all logged actions', () async {
      // Create an instance of a class using the History mixin
      var mockHistory = MockHistory();

      // Log actions
      mockHistory.log('Book borrowed');
      mockHistory.log('Book returned');

      // Capture the output of showHistory()
      var printedOutput = await _capturePrint(() {
        mockHistory.showHistory();
      });

      // Check if the correct history is printed
      expect(printedOutput, contains('Book borrowed'));
      expect(printedOutput, contains('Book returned'));
    });
  });
}

// Helper function to capture print statements during a test
Future<String> _capturePrint(Function() testFunction) async {
  var buffer = StringBuffer();
  var spec = ZoneSpecification(print: (self, parent, zone, message) {
    buffer.writeln(message);
  });

  await Zone.current.fork(specification: spec).run(() {
    testFunction();
  });

  return buffer.toString();
}
