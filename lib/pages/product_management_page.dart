import 'package:first_flutter_app/data/product.dart'; // asumsi ini ada productList
import 'package:first_flutter_app/models/product_model.dart';
import 'package:first_flutter_app/widgets/app_bar_widget.dart';
import 'package:first_flutter_app/widgets/blank_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductManagementPage extends StatefulWidget {
  const ProductManagementPage({super.key});

  @override
  State<ProductManagementPage> createState() => _ProductManagementPageState();
}

class _ProductManagementPageState extends State<ProductManagementPage> {
  List<ProductModel> products = List.from(productList); // copy dari data existing, dinamis

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(title: 'Kelola Produk'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Daftar Produk",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Column(
                      children: [
                        BlankCardWidget(
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  product.image,
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      "Rp ${formatRupiah(product.price)}",
                                      style: const TextStyle(
                                        color: Color(0xff4D8EFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      product.category.displayName,
                                      style: const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => _showEditProductDialog(context, index),
                                    icon: const Icon(Iconsax.edit, color: Color(0xff4D8EFF)),
                                  ),
                                  IconButton(
                                    onPressed: () => _deleteProduct(index),
                                    icon: const Icon(Iconsax.trash, color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16), // space antar item
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddProductDialog(context),
        backgroundColor: const Color(0xff4D8EFF),
        child: const Icon(Iconsax.add, color: Colors.white),
      ),
    );
  }

  // Dialog untuk tambah produk baru
  void _showAddProductDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    ProductCategory? selectedCategory;
    String image = "assets/images/produk1.webp"; // default, bisa diubah nanti

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Tambah Produk"),
          content: StatefulBuilder(
            builder: (context, setDialogState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "Nama Produk"),
                  ),
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Harga (Rp)"),
                  ),
                  const SizedBox(height: 12),
                  DropdownButton<ProductCategory>(
                    value: selectedCategory,
                    hint: const Text("Pilih Kategori"),
                    onChanged: (val) {
                      setDialogState(() => selectedCategory = val);
                    },
                    items: ProductCategory.values.map((cat) {
                      return DropdownMenuItem(
                        value: cat,
                        child: Text(cat.displayName),
                      );
                    }).toList(),
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && priceController.text.isNotEmpty && selectedCategory != null) {
                  final newProduct = ProductModel(
                    name: nameController.text,
                    price: int.parse(priceController.text),
                    image: image,
                    category: selectedCategory!,
                  );
                  setState(() {
                    products.add(newProduct);
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Tambah"),
            ),
          ],
        );
      },
    );
  }

  // Dialog untuk edit produk
  void _showEditProductDialog(BuildContext context, int index) {
    final product = products[index];
    final TextEditingController nameController = TextEditingController(text: product.name);
    final TextEditingController priceController = TextEditingController(text: product.price.toString());
    ProductCategory? selectedCategory = product.category;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Produk"),
          content: StatefulBuilder(
            builder: (context, setDialogState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: "Nama Produk"),
                  ),
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Harga (Rp)"),
                  ),
                  const SizedBox(height: 12),
                  DropdownButton<ProductCategory>(
                    value: selectedCategory,
                    hint: const Text("Pilih Kategori"),
                    onChanged: (val) {
                      setDialogState(() => selectedCategory = val);
                    },
                    items: ProductCategory.values.map((cat) {
                      return DropdownMenuItem(
                        value: cat,
                        child: Text(cat.displayName),
                      );
                    }).toList(),
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && priceController.text.isNotEmpty && selectedCategory != null) {
                  setState(() {
                    products[index] = ProductModel(
                      name: nameController.text,
                      price: int.parse(priceController.text),
                      image: product.image, // tetep image lama
                      category: selectedCategory!,
                    );
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  // Hapus produk
  void _deleteProduct(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hapus Produk?"),
          content: const Text("Yakin mau hapus produk ini?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  products.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: const Text("Hapus", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // Helper format rupiah (sama seperti di CheckoutPage)
  String formatRupiah(int amount) {
    final str = amount.toString();
    final parts = <String>[];
    for (int i = str.length; i > 0; i -= 3) {
      final start = i - 3;
      parts.add(str.substring(start < 0 ? 0 : start, i));
    }
    return parts.reversed.join('.');
  }
}
