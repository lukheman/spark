import 'package:first_flutter_app/widgets/header_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          HeaderIconWidget(
            icon: Iconsax.arrow_left,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 6),

          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
