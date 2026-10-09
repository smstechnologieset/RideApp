import 'package:flutter_test/flutter_test.dart';
import 'package:ride_app/main.dart';

void main() {
  testWidgets('ZemenGoApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ZemenGoApp());
    expect(find.byType(ZemenGoApp), findsOneWidget);

    // Pump past the splash auto-advance timer
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  });
}
