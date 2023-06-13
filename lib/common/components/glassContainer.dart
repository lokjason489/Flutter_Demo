import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget? child;
  final double borderRadius;
  final double blur;
  final double blurRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  const GlassContainer({
    Key? key,
    this.child,
    this.borderRadius = 15.0,
    this.blur = 10.0,
    this.blurRadius = 5.0,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context)
                .colorScheme
                .secondaryContainer
                .withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: blurRadius,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: blur, sigmaY: blur, tileMode: TileMode.mirror),
          // blendMode: BlendMode.lighten,
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.02),
                width: 1.0,
              ),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.07),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
