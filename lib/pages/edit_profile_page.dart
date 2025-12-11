import 'package:first_flutter_app/widgets/app_bar_widget.dart';
import 'package:first_flutter_app/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(title: 'Ubah Profil'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Image.asset(
                          "assets/images/user.png",
                          height: 110,
                          width: 110,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 6,
                        right: 6,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Iconsax.camera,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ===================== FORM ======================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _inputField(
                      title: "Nama",
                      icon: Iconsax.user,
                      hint: "Lukmanul Rahman",
                    ),
                    const SizedBox(height: 20),

                    _inputField(
                      title: "Email",
                      icon: Iconsax.sms,
                      hint: "akmal@example.com",
                    ),
                    const SizedBox(height: 20),

                    _inputField(
                      title: "No. Handphone",
                      icon: Iconsax.call,
                      hint: "+62 812 3456 7890",
                    ),
                    const SizedBox(height: 20),

                    _inputField(
                      title: "Alamat",
                      icon: Iconsax.location,
                      hint: "Masukkan alamat anda",
                      maxLines: 3,
                    ),
                    const SizedBox(height: 40),

                    _saveButton(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===================== COMPONENTS ======================

  Widget _inputField({
    required String title,
    required IconData icon,
    required String hint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black.withOpacity(0.06),
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: maxLines > 1
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Icon(icon, size: 22, color: Colors.black),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _saveButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xff4D8EFF),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Center(
        child: Text(
          "Simpan Perubahan",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
