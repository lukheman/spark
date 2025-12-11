import 'package:flutter/material.dart';

class BlankCardWidget extends StatelessWidget {
  final Widget child;

  const BlankCardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
