import 'package:first_flutter_app/widgets/app_bar_widget.dart';
import 'package:first_flutter_app/widgets/blank_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  // Data tracking contoh (bisa diganti dari API nanti)
  final List<Map<String, String>> trackingSteps = const [
    {
      'date': '3 Des',
      'time': '14:02',
      'message': 'Pesanan tiba di alamat tujuan. diterima di Depan pos satpam.',
      'location': '',
      'isActive': 'true', // aktif (dot hijau)
      'isCurrent': 'true', // step saat ini
    },
    {
      'date': '3 Des',
      'time': '07:18',
      'message': 'Pesanan dalam proses pengantaran.',
      'location': '',
    },
    {
      'date': '3 Des',
      'time': '07:17',
      'message': 'Kurir sudah ditugaskan. Pesanan akan dikirim.',
      'location': '',
    },
    {
      'date': '3 Des',
      'time': '06:00',
      'message':
          'Pesanan diproses di lokasi transit Kab. Kolaka, Watubangga Hub.',
      'location': '',
    },
    {
      'date': '3 Des',
      'time': '05:19',
      'message': 'Pesanan tiba di lokasi transit Kab. Kolaka, Watubangga Hub.',
      'location': '',
    },
    {
      'date': '2 Des',
      'time': '19:52',
      'message':
          'Pesanan dikirim dari lokasi sortir Kota Kendari, Wua-Wua DC ke Kab. Kolaka, Watubangga Hub via darat dengan estimasi waktu 2 hari.',
      'location': '',
    },
    {
      'date': '2 Des',
      'time': '13:04',
      'message': 'Pesanan telah disortir di Kota Kendari, Wua-Wua DC.',
      'location': '',
    },
    // Tambah lebih banyak jika perlu...
  ];

  @override
  Widget build(BuildContext context) {
    String alamat = "Jl. Example No. 123, Jakarta"; // sekarang dinamis
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: 'Pesanan Tiba',
        onTap: () {
          Navigator.pushNamed(context, '/home');
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= HEADER STATUS =================
              Text(
                "Pesanan tiba pada 3 Des",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              // Progress bar
              Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(height: 4, color: const Color(0xffE0E0E0)),
                        FractionallySizedBox(
                          widthFactor: 1.0, // full karena sudah tiba
                          child: Container(
                            height: 4,
                            color: const Color(0xff4D8EFF).withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statusLabel("Sedang Dikirim", false),
                  _statusLabel("Menuju Alamatmu", false),
                  _statusLabel("Pesanan Tiba", true),
                ],
              ),
              const SizedBox(height: 12),
              BlankCardWidget(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Alamat",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            alamat,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              BlankCardWidget(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Metode Pembayaran",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Cash On Delivery",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              BlankCardWidget(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Expedisi",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "JNT",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ================= INFO PESANAN =================
              BlankCardWidget(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/images/produk1.webp", // ganti dengan image pesanan
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Antarmi Saja",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "ANRMS059468572798",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                      // OutlinedButton(
                      //   onPressed: () {
                      //     // TODO: Navigasi ke rincian pesanan
                      //   },
                      //   style: OutlinedButton.styleFrom(
                      //     side: const BorderSide(color: Color(0xff4D8EFF)),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //   ),
                      //   child: const Text(
                      //     "Rincian Pesanan",
                      //     style: TextStyle(color: Color(0xff4D8EFF)),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // ================= TIMELINE TRACKING =================
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: trackingSteps.length,
                itemBuilder: (context, index) {
                  final step = trackingSteps[index];
                  final isActive = step['isActive'] == 'true';
                  final isCurrent = step['isCurrent'] == 'true';
                  final isFirst = index == 0;
                  final isLast = index == trackingSteps.length - 1;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Timeline dot & line
                      Column(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isActive
                                  ? const Color(0xff4D8EFF)
                                  : Colors.grey[400],
                              border: isCurrent
                                  ? Border.all(
                                      color: const Color(0xff4D8EFF),
                                      width: 3,
                                    )
                                  : null,
                            ),
                          ),
                          if (!isLast)
                            Container(
                              width: 2,
                              height: 80, // adjust berdasarkan konten
                              color: isActive
                                  ? const Color(0xff4D8EFF).withOpacity(0.3)
                                  : Colors.grey[300],
                            ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  step['date']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  step['time']!,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              step['message']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: isActive
                                    ? Colors.black87
                                    : Colors.grey[600],
                                fontWeight: isActive
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                            ),
                            if (step['location']!.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Text(
                                step['location']!,
                                style: const TextStyle(
                                  color: Color(0xff4D8EFF),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                            const SizedBox(height: 24), // space antar step
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusLabel(String text, bool isActive) {
    return Row(
      children: [
        if (isActive)
          const Icon(Iconsax.tick_circle, color: Color(0xff4D8EFF), size: 16),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? const Color(0xff4D8EFF) : Colors.grey,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
