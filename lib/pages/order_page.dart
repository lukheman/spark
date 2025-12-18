import 'package:first_flutter_app/widgets/app_bar_widget.dart';
import 'package:first_flutter_app/widgets/blank_card_widget.dart';
import 'package:first_flutter_app/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(title: 'Pesanan'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _orderItem(
                    context: context,
                    image: "assets/images/maskara1.jpg",
                    title: "Essence Volume Mascara",
                    price: 85000,
                    date: "20 Nov 2025",
                    status: "Dikirim",
                    statusColor: Colors.orange,
                  ),
                  _orderItem(
                    context: context,
                    image: "assets/images/libstik2.jpg",
                    title: "Warda Crystal Matte Lip Cream",
                    price: 68000,
                    date: "18 Nov 2025",
                    status: "Selesai",
                    statusColor: Colors.green,
                  ),
                  _orderItem(
                    context: context,
                    image: "assets/images/lipstik1.jpg",
                    title: "YSL Exclusive Matte Lip Cream",
                    price: 75000,
                    date: "17 Nov 2025",
                    status: "Diproses",
                    statusColor: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderItem({
    required BuildContext context, // tambah ini buat navigasi
    required String image,
    required String title,
    required int price,
    required String date,
    required String status,
    required Color statusColor,
  }) {
    return BlankCardWidget(
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(image, height: 70, width: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Rp $price",
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(height: 6),
                Text(
                  date,
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
          // Status & Button Detail
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                status,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8), // space biar rapi
              TextButton(
                onPressed: () {
                  // Navigasi ke detail pesanan
                  Navigator.pushNamed(
                    context,
                    '/order_tracking',
                  ); // ganti route sesuai app lo
                },
                child: const Text(
                  "Status Pengiriman",
                  style: TextStyle(color: Color(0xff4D8EFF)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
