import 'package:first_flutter_app/data/product.dart';
import 'package:first_flutter_app/models/product_model.dart';
import 'package:first_flutter_app/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // Lebih modern dari Icons.favorite_border
class ProductCardWidget extends StatefulWidget {
  final ProductModel product;
  const ProductCardWidget({super.key, required this.product});
  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}
class _ProductCardWidgetState extends State<ProductCardWidget>
    with SingleTickerProviderStateMixin {
  bool isFavorited = false;
  // Animasi halus saat diklik
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.4,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
    _controller.forward().then((_) => _controller.reverse());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(product: widget.product),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Rp ${widget.product.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4D8EFF),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.star_rounded, color: Colors.amber, size: 18),
                    SizedBox(width: 4),
                    Text("3.8", style: TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
                // Favorite Button dengan animasi
                GestureDetector(
                  onTap: _toggleFavorite,
                  child: AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Icon(
                          isFavorited ? Iconsax.heart5 : Iconsax.heart,
                          color: isFavorited
                              ? Colors.red
                              : Colors.grey.shade600,
                          size: 24,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
