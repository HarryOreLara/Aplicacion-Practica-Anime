import 'package:flutter/material.dart';
import 'dart:ui';

class BlurContainer extends StatelessWidget {
  const BlurContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(//Para dar curvaturas a imagenes
    borderRadius: BorderRadius.circular(8),
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 12.0,
        sigmaY: 12.0,
      ),
      child: child,
    ),
    );
  }
}