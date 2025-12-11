import 'package:first_flutter_app/widgets/app_bar_widget.dart';
import 'package:first_flutter_app/widgets/blank_card_widget.dart';
import 'package:first_flutter_app/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // qty untuk setiap item
  List<int> qty = [1, 2, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(title: 'Keranjang'),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _cartItem(
                    image: "assets/images/produk1.webp",
                    title: "Spark Brightening Toner",
                    price: 89000,
                    qty: qty[0],
                    onAdd: () {
                      setState(() => qty[0]++);
                    },
                    onMinus: () {
                      if (qty[0] > 1) {
                        setState(() => qty[0]--);
                      }
                    },
                  ),

                  _cartItem(
                    image: "assets/images/produk1.webp",
                    title: "Spark Facial Wash",
                    price: 59000,
                    qty: qty[1],
                    onAdd: () {
                      setState(() => qty[1]++);
                    },
                    onMinus: () {
                      if (qty[1] > 1) {
                        setState(() => qty[1]--);
                      }
                    },
                  ),

                  _cartItem(
                    image: "assets/images/produk1.webp",
                    title: "Spark Sunscreen SPF 50+",
                    price: 79000,
                    qty: qty[2],
                    onAdd: () {
                      setState(() => qty[2]++);
                    },
                    onMinus: () {
                      if (qty[2] > 1) {
                        setState(() => qty[2]--);
                      }
                    },
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),

            // ===================== BOTTOM TOTAL ======================
            _bottomCheckout(),
          ],
        ),
      ),
    );
  }

  // ===================== COMPONENTS ======================

  Widget _cartItem({
    required String image,
    required String title,
    required int price,
    required int qty,
    required VoidCallback onAdd,
    required VoidCallback onMinus,
  }) {
    return BlankCardWidget(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(image, height: 70, width: 70, fit: BoxFit.cover),
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
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Rp $price",
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),

          Row(
            children: [
              GestureDetector(
                onTap: onMinus,
                child: const Icon(Iconsax.minus, size: 20),
              ),
              const SizedBox(width: 10),
              Text(
                qty.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: onAdd,
                child: const Icon(Iconsax.add, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomCheckout() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFEAEAEA), // garis tipis minimalis
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Total",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 2),
              Text(
                "Rp 316.000",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xff4D8EFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
