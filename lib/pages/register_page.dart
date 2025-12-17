import 'package:first_flutter_app/widgets/input_widget.dart';
import 'package:first_flutter_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // Tambahkan import iconsax

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // === ILLUSTRATION ===
                Image.asset("assets/images/spark_logo.png", height: 150),
                const SizedBox(height: 20),
                // === TITLE ===
                const Text(
                  "Registrasi",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                // === FULL NAME ===
                InputWidget(hintText: "Nama lengkap", icon: Iconsax.user),
                const SizedBox(height: 16),
                // === EMAIL ===
                InputWidget(
                  hintText: "Email",
                  icon: Iconsax.sms,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                // === PHONE NUMBER ===
                InputWidget(
                  hintText: "Nomor Telephone",
                  icon: Iconsax.call,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                // === PASSWORD ===
                InputWidget(
                  hintText: "Password",
                  icon: Iconsax.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                // === BUTTON REGISTER ===
                PrimaryButton(
                  label: "Registrasi",
                  onPressed: () {
                    Navigator.pushNamed(context, '/onboarding');
                  },
                ),
                const SizedBox(height: 20),
                // === LOGIN TEXT ===
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Telah memiliki akun?",
                      style: TextStyle(fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        "Masuk",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7C99FF),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _roundedInput tetap ada tapi tidak dipakai (tidak dihapus karena permintaan "jangan ubah hal lain")
  Widget _roundedInput({
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          suffixIcon: Icon(icon, color: Colors.grey),
        ),
      ),
    );
  }
}
