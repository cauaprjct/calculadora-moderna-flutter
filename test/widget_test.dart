import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora_app/main.dart';

void main() {
  group('Calculator Widget Tests', () {
    testWidgets('Calculator app loads correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const CalculatorApp());

      // Verify that the app loads without errors
      expect(find.byType(Calculator), findsOneWidget);
    });

    testWidgets('Displays initial value', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const CalculatorApp());

      // Verify initial state
      expect(find.text('0'), findsWidgets);
    });

    testWidgets('Clear button works', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const CalculatorApp());

      // Enter a number
      await tester.tap(find.text('1'));
      await tester.pump();

      // Tap clear button
      await tester.tap(find.text('C'));
      await tester.pump();

      // Verify display is cleared
      expect(find.text('0'), findsWidgets);
    });
  });
}