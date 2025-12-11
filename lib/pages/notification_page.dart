import 'package:first_flutter_app/widgets/app_bar_widget.dart';
import 'package:first_flutter_app/widgets/blank_card_widget.dart';
import 'package:first_flutter_app/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(title: 'Notifikasi'),
      body: SafeArea(
        child: Column(
          children: [
            // ================= LIST NOTIFIKASI =================
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _notifCard(
                    title: "Pesanan Dikirim",
                    message: "Paket skincare kamu sedang dalam perjalanan.",
                    time: "10 menit lalu",
                    icon: Iconsax.truck_fast,
                  ),
                  _notifCard(
                    title: "Chat dari Dokter",
                    message: "Dokter telah membalas konsultasi kamu.",
                    time: "1 jam lalu",
                    icon: Iconsax.message_text_1,
                  ),
                  _notifCard(
                    title: "Promo Baru!",
                    message: "Diskon 50% untuk produk acne treatment!",
                    time: "Kemarin",
                    icon: Iconsax.discount_circle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _notifCard({
    required String title,
    required String message,
    required String time,
    required IconData icon,
  }) {
    return BlankCardWidget(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xff7C99FF).withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, size: 24, color: const Color(0xff7C99FF)),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
