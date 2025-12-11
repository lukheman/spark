import 'package:first_flutter_app/widgets/app_bar_widget.dart';
import 'package:first_flutter_app/widgets/blank_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int qty = 1; // dari previous page
  String selectedPayment = "transfer"; // default
  final int hargaDiskon = 45000;
  final int ongkir = 15000; // contoh
  final int biayaAdmin = 2000; // contoh

  int get subtotal => hargaDiskon * qty;
  int get total => subtotal + ongkir + biayaAdmin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(title: 'Checkout'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===================== INFORMASI PRODUK =======================
              const Text(
                "Informasi Produk",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              BlankCardWidget(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/produk1.webp",
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "La Mousse",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Rp ${formatRupiah(hargaDiskon)}",
                            style: const TextStyle(
                              color: Color(0xff4D8EFF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "x $qty",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // ===================== PILIH METODE PEMBAYARAN =======================
              const Text(
                "Metode Pembayaran",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  RadioListTile<String>(
                    value: "cash",
                    groupValue: selectedPayment,
                    onChanged: (val) => setState(() => selectedPayment = val!),
                    title: const Text("Cash on Delivery"),
                    contentPadding: EdgeInsets.zero,
                    activeColor: const Color(0xff4D8EFF),
                  ),
                  RadioListTile<String>(
                    value: "transfer",
                    groupValue: selectedPayment,
                    onChanged: (val) => setState(() => selectedPayment = val!),
                    title: const Text("Transfer Bank"),
                    contentPadding: EdgeInsets.zero,
                    activeColor: const Color(0xff4D8EFF),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // ===================== ALAMAT PEMBAYARAN / PENGIRIMAN =======================
              const Text(
                "Alamat Pengiriman",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              BlankCardWidget(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rumah (Default)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Jl. Example No. 123, Jakarta",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Ubah alamat
                      },
                      child: const Text(
                        "Ubah",
                        style: TextStyle(color: Color(0xff4D8EFF)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // ===================== RINCIAN PEMBAYARAN =======================
              const Text(
                "Rincian Pembayaran",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              BlankCardWidget(
                child: Column(
                  children: [
                    _rincianRow("Subtotal Produk", formatRupiah(subtotal)),
                    const SizedBox(height: 12),
                    _rincianRow("Ongkos Kirim", formatRupiah(ongkir)),
                    const SizedBox(height: 12),
                    _rincianRow("Biaya Admin", formatRupiah(biayaAdmin)),
                    const Divider(height: 24),
                    _rincianRow(
                      "Total",
                      formatRupiah(total),
                      isBold: true,
                      color: const Color(0xff4D8EFF),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100), // space for bottom bar
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Text(
                  "Rp ${formatRupiah(total)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4D8EFF),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 52,
              child: FilledButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/order_processing');
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xff4D8EFF),
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Buat Pesanan",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper untuk baris rincian
  Widget _rincianRow(
    String label,
    String value, {
    bool isBold = false,
    Color? color,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: isBold ? 16 : 14,
          ),
        ),
        Text(
          "Rp $value",
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: isBold ? 16 : 14,
            color: color ?? Colors.black87,
          ),
        ),
      ],
    );
  }

  // Helper format rupiah (simple tanpa regex)
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
