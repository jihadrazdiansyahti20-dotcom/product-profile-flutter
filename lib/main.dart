import 'package:flutter/material.dart';

void main() {
  runApp(const ProductProfileApp());
}

class ProductProfileApp extends StatelessWidget {
  const ProductProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product & Profile',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: const Color(0xFFF3F6FB),
      ),
      home: const ProductProfilePage(),
    );
  }
}

class ProductProfilePage extends StatelessWidget {
  const ProductProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PPM Sesi 2 - Jihad Razdiansyah (20200040050)',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          PromoBanner(),
          SizedBox(height: 20),
          ProfileCard(),
          SizedBox(height: 20),
          ProductCard(),
        ],
      ),
    );
  }
}

// Banner promo menggunakan Stack dan Positioned
class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.indigo],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 18,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PROMO SPESIAL!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Diskon hingga 25%',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  'Belanja sekarang!',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const Positioned(
            right: 18,
            bottom: 18,
            child: Icon(Icons.local_offer, size: 55, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

// Kartu profil menggunakan StatelessWidget
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Text(
              'PROFIL MAHASISWA',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 42,
              backgroundColor: Color(0xFFDCE8FF),
              child: Icon(Icons.person, size: 50, color: Colors.blue),
            ),
            const SizedBox(height: 12),
            const Text(
              'Jihad Razdiansyah',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text('NIM: 20200040050'),
            const Text('Prodi: Teknik Informatika'),
            const Text('Kelas: TI24D'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) =>
                    const Icon(Icons.star, color: Colors.amber, size: 28),
              ),
            ),
            const SizedBox(height: 5),
            const Text('Mahasiswa Aktif', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

// Kartu produk menggunakan StatefulWidget
class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final String productName = 'Headphone Wireless';
  final String category = 'Elektronik';
  final int price = 250000;

  int quantity = 1;
  int likes = 12;
  bool isFavorite = false;

  String formatRupiah(int value) {
    final digits = value.toString();
    final result = StringBuffer();

    for (int i = 0; i < digits.length; i++) {
      result.write(digits[i]);

      final remaining = digits.length - i - 1;
      if (remaining > 0 && remaining % 3 == 0) {
        result.write('.');
      }
    }

    return 'Rp$result';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'PRODUK PILIHAN',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 14),

            // Placeholder gambar produk
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.headphones, size: 90, color: Colors.blue),
            ),

            const SizedBox(height: 14),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Kategori: $category',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        formatRupiah(price),
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Tombol Favorite
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                          likes += isFavorite ? 1 : -1;
                        });
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 30,
                      ),
                    ),
                    Text('$likes Like'),
                  ],
                ),
              ],
            ),

            const Divider(height: 28),

            // Pengatur jumlah produk
            Row(
              children: [
                const Expanded(
                  child: Text('Jumlah produk', style: TextStyle(fontSize: 16)),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) {
                        quantity--;
                      }
                    });
                  },
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text('Total harga', style: TextStyle(fontSize: 16)),
                  ),
                  Text(
                    formatRupiah(price * quantity),
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Tombol tambah ke keranjang
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '$productName sebanyak $quantity berhasil '
                        'ditambahkan ke keranjang!',
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Tambah ke Keranjang'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
