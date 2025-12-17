import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Halaman yang muncul setelah user klik "Buat Pesanan"
/// Menampilkan animasi keren + teks "Sedang memproses pesanan..."
class OrderProcessingPage extends StatefulWidget {
  const OrderProcessingPage({super.key});

  @override
  State<OrderProcessingPage> createState() => _OrderProcessingPageState();
}

class _OrderProcessingPageState extends State<OrderProcessingPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    // Auto pindah ke halaman sukses setelah 4 detik
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_) => const OrderSuccessPage()),
      // );
      Navigator.pushNamed(context, '/order_tracking');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animasi Lottie (mobil pengiriman / paket terbang)
              Lottie.asset(
                'assets/animations/Delivery Riding.json', // ← kamu pilih salah satu di bawah
                width: 280,
                controller: _controller,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..repeat();
                },
              ),
              const SizedBox(height: 48),

              const Text(
                "Sedang memproses pesananmu...",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                "Tunggu sebentar ya, kurir lagi otw nih!",
                style: TextStyle(fontSize: 15, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Indikator loading kecil biar lebih hidup
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4D8EFF)),
                strokeWidth: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================== HALAMAN SUKSES (BONUS) ==================
class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/success_confetti.json',
                width: 300,
                repeat: false,
              ),
              const SizedBox(height: 40),
              const Text(
                "Pesanan Berhasil Dibuat!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Terima kasih sudah berbelanja. Kurir akan segera mengirimkan pesananmu.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 50),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xff4D8EFF),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text(
                  "Kembali ke Beranda",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
