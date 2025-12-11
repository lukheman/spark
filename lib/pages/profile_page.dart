import 'package:first_flutter_app/widgets/app_bar_widget.dart';
import 'package:first_flutter_app/widgets/blank_card_widget.dart';
import 'package:first_flutter_app/widgets/bottom_nav_widget.dart';
import 'package:first_flutter_app/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavWidget(),
      appBar: const AppBarWidget(title: 'Profil'),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // avatar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      "assets/images/user.png",
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 20),

                  // name + email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "CiciCa",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "akmal@example.com",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ===================== MENU LIST ====================
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _menuItem(
                    Iconsax.user_edit,
                    "Ubah Profile",
                    onTap: () {
                      Navigator.pushNamed(context, '/edit_profile');
                    },
                  ),
                  // _menuItem(Iconsax.lock, "Ubah Password"),
                  _menuItem(
                    Iconsax.bag,
                    "Pesanan",
                    onTap: () {
                      Navigator.pushNamed(context, '/order');
                    },
                  ),
                  // _menuItem(Iconsax.heart, "Wishlist"),
                  // _menuItem(Iconsax.card, "Payment Methods"),
                  _menuItem(
                    Iconsax.notification,
                    "Notifikasi",
                    onTap: () => {
                      Navigator.pushNamed(context, '/notification'),
                    },
                  ),
                  // _menuItem(Iconsax.message_question, "Help & Support"),
                  const SizedBox(height: 20),
                  _logoutButton(context),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===================== COMPONENTS ======================
  Widget _menuItem(IconData icon, String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: BlankCardWidget(
        child: Row(
          children: [
            Icon(icon, size: 22, color: Colors.black),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Iconsax.arrow_right_3, size: 20, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _logoutButton(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => Navigator.pushNamed(context, "/login"),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFFF5C5C),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Text(
          "Keluar",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
