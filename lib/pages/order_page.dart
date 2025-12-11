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
                    image: "assets/images/produk1.webp",
                    title: "Acne Treatment Serum",
                    price: 120000,
                    date: "20 Nov 2025",
                    status: "Dikirim",
                    statusColor: Colors.orange,
                  ),
                  _orderItem(
                    image: "assets/images/produk1.webp",
                    title: "Sunscreen SPF 50 PA+++",
                    price: 85000,
                    date: "18 Nov 2025",
                    status: "Selesai",
                    statusColor: Colors.green,
                  ),
                  _orderItem(
                    image: "assets/images/produk1.webp",
                    title: "Facial Wash Gentle Foam",
                    price: 55000,
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

              // widget lain di bawahnya
            ],
          ),
        ],
      ),
    );
  }
}
