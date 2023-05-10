import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:json_placeholder/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end test', () {
    testWidgets('click users bottom and find first element', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final tapTarget = find.byKey(const ValueKey('BottomNavigationBarUsers'));

      await tester.tap(tapTarget);
      await Future.delayed(const Duration(seconds: 2));
      await tester.pump();
      await Future.delayed(const Duration(seconds: 2));

      final firstUser = find.text('Entry Leanne Graham');

      expect(firstUser, findsOneWidget);
    });
  });
}
