import 'package:first_flutter_app/widgets/input_widget.dart';
import 'package:first_flutter_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  // Fungsi untuk menampilkan pesan sukses atau error
  void _showMessage(String message, {Color color = Colors.green}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
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
                // ===================== TITLE ======================
                const Text(
                  "Lupa Password",
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
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 25),
                // ===================== SUBMIT BUTTON ======================
                PrimaryButton(
                  label: "Kirim Reset Link",
                  onPressed: () {
                    final email = emailController.text.trim();
                    if (email.isEmpty) {
                      _showMessage(
                        "Please enter your email",
                        color: Colors.red,
                      );
                      return;
                    }
                    // Simulasi pengiriman reset link (bisa integrasikan API nanti)
                    _showMessage("Reset link telah dikirim ke email Anda");
                    // Opsional: Navigasi kembali ke login setelah delay
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushNamed(context, '/login');
                    });
                  },
                ),
                const SizedBox(height: 20),
                // ===================== BACK TO LOGIN ======================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Kembali ke "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        "Login",
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
