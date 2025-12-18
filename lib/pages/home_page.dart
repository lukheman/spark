import 'package:first_flutter_app/data/product.dart';
import 'package:first_flutter_app/models/product_model.dart';
import 'package:first_flutter_app/widgets/bottom_nav_widget.dart';
import 'package:first_flutter_app/widgets/header_icon_widget.dart';
import 'package:first_flutter_app/widgets/product_card_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SparkHomePage extends StatefulWidget {
  const SparkHomePage({super.key});
  @override
  State<SparkHomePage> createState() => _SparkHomePageState();
}

class _SparkHomePageState extends State<SparkHomePage> {
  ProductCategory? selectedCategory;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),
              const SizedBox(height: 20),
              _balanceSection(context),
              const SizedBox(height: 20),
              CategoryFilter(
                onSelected: (cat) {
                  setState(() {
                    selectedCategory = cat;
                  });
                },
              ),
              const SizedBox(height: 20),
              Expanded(child: _productGrid()),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------------------------------
  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _searchBar()), // <-- PENTING: kasih Expanded di sini
        const SizedBox(width: 10),
        Stack(
          children: [
            HeaderIconWidget(
              icon: Iconsax.shopping_bag,
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  "99+",
                  style: TextStyle(fontSize: 8, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        // profile icon
        HeaderIconWidget(
          icon: Iconsax.user,
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ],
    );
  }

  Widget _balanceSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withOpacity(0.06),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bagian saldo
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Saldo",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 3),
              Text(
                "Rp 120.000",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4D8EFF),
                ),
              ),
            ],
          ),
          // Tombol topup
        ],
      ),
    );
  }

  // -------------------------------------------
  Widget _searchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xffF6F6F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                icon: Icon(Iconsax.search_normal_1),
                hintText: "Cari",
              ),
            ),
          ),
        ),
      ],
    );
  }

  // -------------------------------------------
  Widget _productGrid() {
    final displayList = productList
        .where(
          (p) => selectedCategory == null || p.category == selectedCategory,
        )
        .where(
          (p) =>
              _searchQuery.isEmpty ||
              p.name.toLowerCase().contains(_searchQuery),
        )
        .toList();
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: displayList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final product = displayList[index];
        return ProductCardWidget(product: product);
      },
    );
  }
}

class CategoryFilter extends StatefulWidget {
  final Function(ProductCategory?)? onSelected; // null = all
  const CategoryFilter({super.key, this.onSelected});
  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  ProductCategory? selectedCategory; // null = all
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // Tombol All
              _buildItem("Semua", selectedCategory == null, () {
                setState(() => selectedCategory = null);
                widget.onSelected?.call(null);
              }),
              const SizedBox(width: 12),
              for (final cat in ProductCategory.values) ...[
                _buildItem(cat.displayName, selectedCategory == cat, () {
                  setState(() => selectedCategory = cat);
                  widget.onSelected?.call(cat);
                }),
                const SizedBox(width: 12),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String text, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? const Color(0xff4D8EFF) : const Color(0xffeeeeee),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
