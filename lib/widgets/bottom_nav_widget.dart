import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xff4D8EFF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/message'),
            child: const Icon(Iconsax.message, color: Colors.white, size: 28),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/home'),
            child: const Icon(Iconsax.home_1, color: Colors.white, size: 28),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/notification'),
            child: const Icon(
              Iconsax.notification,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
