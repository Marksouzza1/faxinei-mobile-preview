import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    required this.child,
    this.maxWidth = 920,
    this.padding,
    super.key,
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: padding ??
                EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth < 520 ? 20 : 32,
                  vertical: 24,
                ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
