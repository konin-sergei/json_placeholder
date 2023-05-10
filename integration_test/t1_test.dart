import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder/main.dart';

void main() {
  testWidgets('test home page', (tester) async {

    await tester.pumpWidget(const JsonPlaceholderApp());
    expect(find.text('App for test task'), findsOneWidget);

  });
}