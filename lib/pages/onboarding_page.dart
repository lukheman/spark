import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // === PAGE VIEW ===
          PageView(
            controller: _pageController,
            onPageChanged: (i) => setState(() => currentPage = i),
            children: const [
              LottieSlide(
                lottie: 'assets/animations/shopping cart.json',
                title: "Belanja Jadi Super Gampang",
                subtitle:
                    "Ribuan produk berkualitas, harga terbaik, langsung dari HP kamu",
              ),
              LottieSlide(
                lottie: 'assets/animations/Delivery Riding.json',
                title: "Pengiriman Cepat & Aman",
                subtitle:
                    "Pesanan sampai dalam 1–3 hari dengan kurir terpercaya ke seluruh Indonesia",
              ),
              LottieSlide(
                lottie: 'assets/animations/Add To Cart Success.json',
                title: "Bayar Aman, Tenang Belanja",
                subtitle:
                    "100% terjamin, garansi uang kembali, dan support 24 jam",
              ),
            ],
          ),

          // === INDICATOR + BUTTON ===
          Positioned(
            bottom: 80,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // Dots
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Color(0xff4D8EFF),
                    dotColor: Colors.grey,
                    dotHeight: 9,
                    dotWidth: 9,
                    spacing: 8,
                    expansionFactor: 4,
                  ),
                ),

                const SizedBox(height: 40),

                // Tombol Utama
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xff4D8EFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (currentPage == 2) {
                        // Slide terakhir → masuk ke app
                        Navigator.of(context).pushReplacementNamed('/home');
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      currentPage == 2 ? "Mulai Belanja" : "Lanjut",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Skip
                if (currentPage < 2)
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushReplacementNamed('/home'),
                    child: const Text(
                      "Lewati",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================== SATU SLIDE DENGAN LOTTIE ==================
class LottieSlide extends StatelessWidget {
  final String lottie;
  final String title;
  final String subtitle;

  const LottieSlide({
    super.key,
    required this.lottie,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
      child: Column(
        children: [
          // Animasi Lottie
          Lottie.asset(
            lottie,
            width: double.infinity,
            height: 200,
            fit: BoxFit.contain,
            repeat: true,
          ),

          const SizedBox(height: 50),

          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 20),

          // Subtitle
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
