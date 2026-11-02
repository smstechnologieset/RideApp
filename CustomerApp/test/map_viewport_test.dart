import 'package:flutter_test/flutter_test.dart';
import 'package:ride_app/widgets/gebeta_map_widget.dart';

void main() {
  for (final viewport in [
    (height: 180.0, covered: 38.0),
    (height: 300.0, covered: 210.0),
    (height: 640.0, covered: 425.0),
    (height: 914.0, covered: 560.0),
  ]) {
    test('route bounds retain visible area at height ${viewport.height}', () {
      final insets = gebetaRouteInsets(
        height: viewport.height,
        bottomPadding: viewport.covered,
        safeTop: 24,
      );
      expect(insets.top, greaterThanOrEqualTo(0));
      expect(insets.bottom, greaterThanOrEqualTo(0));
      expect(insets.top + insets.bottom, lessThan(viewport.height));
      if (viewport.height == 180) {
        expect(insets.top, lessThan(90));
        expect(insets.bottom, lessThan(60));
      }
    });
  }
}
