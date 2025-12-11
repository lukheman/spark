import 'package:flutter/material.dart';

class HeaderIconWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const HeaderIconWidget({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(blurRadius: 8, color: Colors.black.withOpacity(0.1)),
          ],
        ),
        child: Icon(icon, size: 22),
      ),
    );
  }
}
