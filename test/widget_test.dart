import 'package:flutter_test/flutter_test.dart';
import 'package:harshsawkare/app/app.dart';

void main() {
  testWidgets('Wallet screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    // Verify the brand title renders on screen.
    expect(find.text('MONEY'), findsOneWidget);
  });
}
