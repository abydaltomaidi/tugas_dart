import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantApp());
}

//class RestaurantApp
class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Detail',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE85D04)),
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
      ),
      home: const RestaurantDetailPage(),
    );
  }
}

//class RestaurantDetailPage
class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dapur Nusantara',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Link restoran siap dibagikan!')),
              );
            },
            icon: const Icon(Icons.share_outlined),
            tooltip: 'Bagikan',
          ),
        ],
      ),

      // Tombol reservasi
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Membuka halaman reservasi...')),
          );
        },
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.calendar_month),
        label: const Text(
          'Reservasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // HERO IMAGE
            // =========================
            SizedBox(
              width: double.infinity,
              height: 230,
              child: Image.network(
                'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4'
                '?auto=format&fit=crop&w=1200&q=80',
                fit: BoxFit.cover,
              ),
            ),

            // =========================
            // INFO UTAMA
            // =========================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Dapur Nusantara',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF222222),
                              ),
                            ),
                            const SizedBox(height: 6),

                            // Rating
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  '4.8',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '(328 ulasan)',
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Badge kategori
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE8D6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Indonesia',
                          style: TextStyle(
                            color: Color(0xFFE85D04),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Alamat
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: colorScheme.primary,
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Jl. Merdeka No. 25, Ternate, Maluku Utara',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF555555),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // =========================
            // STATISTIK
            // =========================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatItem(
                      icon: Icons.directions_walk,
                      value: '1.2 km',
                      label: 'Jarak',
                      color: Colors.blue,
                    ),
                    _VerticalDivider(),
                    _StatItem(
                      icon: Icons.access_time,
                      value: '10:00–22:00',
                      label: 'Jam Buka',
                      color: Colors.green,
                    ),
                    _VerticalDivider(),
                    _StatItem(
                      icon: Icons.payments_outlined,
                      value: 'Rp75K',
                      label: 'Harga rata-rata',
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // =========================
            // DESKRIPSI
            // =========================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Tentang Restoran',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Dapur Nusantara menyajikan berbagai hidangan khas Indonesia '
                'dengan cita rasa autentik dan bahan-bahan pilihan. Nikmati '
                'suasana nyaman bersama keluarga atau teman sambil mencicipi '
                'menu favorit yang dibuat oleh chef berpengalaman.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Color(0xFF666666),
                ),
              ),
            ),

            const SizedBox(height: 26),

            // =========================
            // MENU POPULER
            // =========================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Menu Populer',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lihat semua',
                    style: TextStyle(
                      color: Color(0xFFE85D04),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            SizedBox(
              height: 245,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  _MenuCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1547592180-85f173990554'
                        '?auto=format&fit=crop&w=600&q=80',
                    name: 'Nasi Goreng Kampung',
                    price: 'Rp35.000',
                  ),
                  SizedBox(width: 14),
                  _MenuCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1601050690597-df0568f70950'
                        '?auto=format&fit=crop&w=600&q=80',
                    name: 'Sate Ayam Nusantara',
                    price: 'Rp40.000',
                  ),
                  SizedBox(width: 14),
                  _MenuCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1562565652-a0d8f0c59eb4'
                        '?auto=format&fit=crop&w=600&q=80',
                    name: 'Ayam Bakar Rempah',
                    price: 'Rp45.000',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

// STAT ITEM
class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color, size: 25),
          const SizedBox(height: 7),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
