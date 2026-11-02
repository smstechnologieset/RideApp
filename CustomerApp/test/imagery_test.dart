import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ride_app/widgets/app_artwork.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
    'bundled demo photographs decode and the map vehicle retains transparency',
    () async {
      for (final asset in AppArtwork.all) {
        final bytes = await rootBundle.load(asset);
        final codec = await ui.instantiateImageCodec(
          bytes.buffer.asUint8List(),
          targetWidth: 64,
        );
        final image = (await codec.getNextFrame()).image;
        expect(image.width, greaterThan(0), reason: asset);
        expect(image.height, greaterThan(0), reason: asset);
        if (asset == AppArtwork.mapCar) {
          final rgba = await image.toByteData(
            format: ui.ImageByteFormat.rawRgba,
          );
          expect(
            rgba!.getUint8(3),
            0,
            reason: 'The moving map car must have transparent corners',
          );
        }
        image.dispose();
        codec.dispose();
      }
    },
  );
}
