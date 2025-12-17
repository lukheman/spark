import 'package:first_flutter_app/widgets/input_widget.dart';
import 'package:first_flutter_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi untuk menampilkan pesan error
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // ===================== ILLUSTRATION ======================
                Image.asset("assets/images/spark_logo.png", height: 180),
                const Text(
                  "Sistem Penjualan Produk Kecantikan",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 40),
                // ===================== LOGIN TITLE ======================
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 35),
                // ===================== EMAIL INPUT ======================
                InputWidget(
                  hintText: "Enter your email",
                  icon: Iconsax.sms,
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                // ===================== PASSWORD INPUT ======================
                InputWidget(
                  hintText: "Enter your password",
                  icon: Iconsax.lock,
                  obscureText: hidePassword,
                  controller: passwordController,
                ),
                const SizedBox(height: 25),
                // ===================== LOGIN BUTTON ======================
                PrimaryButton(
                  label: "Login",
                  onPressed: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text;

                    // 1. Cek jika email kosong
                    if (email.isEmpty) {
                      _showError("Please enter your email");
                      return;
                    }

                    // 2. Cek jika password kosong
                    if (password.isEmpty) {
                      _showError("Please enter your password");
                      return;
                    }

                    // 3. Cek email yang benar
                    if (email == 'admin@gmail.com') {
                      Navigator.pushNamed(context, '/product_management');
                    } else if (email == 'pembeli@gmail.com') {
                      Navigator.pushNamed(context, '/onboarding');
                    } else {
                      // Email salah
                      _showError(
                        "Invalid email. Use admin@gmail.com or pembeli@gmail.com",
                      );
                      return;
                    }
                  },
                ),
                const SizedBox(height: 20),
                // ===================== REMEMBER + FORGOT ======================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (v) {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forget password ?",
                        style: TextStyle(
                          color: Color(0xff6E8EFF),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // ===================== REGISTER LINK ======================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("New member ? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        "Register now",
                        style: TextStyle(color: Color(0xff6E8EFF)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
