import 'package:flutter/material.dart';
import 'dart:ui';

class GlassMorph extends StatelessWidget {
  final Widget child;
  const GlassMorph({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      borderRadius: BorderRadius.circular(20),

      child: BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 20, sigmaY: 20,),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              width: 2,
              color: Colors.black.withOpacity(0.2)
            ),
          ),
          child: child,
        ),
      ),

    );
  }
}