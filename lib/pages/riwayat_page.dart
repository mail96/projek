import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_buttom_nav.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  int _selectedIndex = 1;
  String _searchQuery = '';

  // Data paket contoh
  final List<Map<String, String>> _allPackages = [
    {"title": "TO UTBK 2025 PART 15 | PERSUBTEST", "price": "Rp 12.000"},
    {"title": "TO UTBK 2025 PART 15 | FULLTEST", "price": "Rp 12.000"},
    {
      "title": "BONUS DARI BUKU UTBK | AL FAIZ 2025 (TO & KELAS)",
      "price": "Rp 15.000.000"
    },
    {"title": "REKAMAN KELAS UTBK-SNBT 2025 PART 2", "price": "Rp 300.000"},
    {"title": "REKAMAN KELAS UTBK-SNBT 2025 PART 3", "price": "Rp 80.000"},
  ];

  List<Map<String, String>> get _filteredPackages {
    if (_searchQuery.isEmpty) return _allPackages;
    return _allPackages
        .where((p) =>
            p["title"]!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void _onNavTap(int index) {
    setState(() => _selectedIndex = index);
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/paket_saya');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/profil');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'BIMBEL AF'),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (q) => setState(() => _searchQuery = q),
              decoration: InputDecoration(
                hintText: 'Cari paket belajar',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.blue.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _filteredPackages.isEmpty
                  ? const Center(child: Text('Tidak ada paket ditemukan'))
                  : ListView.separated(
                      itemCount: _filteredPackages.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, i) {
                        final p = _filteredPackages[i];
                        return PackageCard(
                          title: p['title']!,
                          price: p['price']!,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final String title;
  final String price;
  const PackageCard({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xff85d8f4)),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/banner2.jpg',
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(color: Color(0xff0086bf))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
