import 'package:flutter/material.dart';

/// The supplied ZemenGo artwork, kept intact rather than redrawn as text.
class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.size = 48});
  final double size;

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(size * .25),
    child: Image.asset(
      'assets/branding/zemengo_logo.png',
      width: size,
      height: size,
      fit: BoxFit.cover,
      semanticLabel: 'ZemenGo logo',
    ),
  );
}
