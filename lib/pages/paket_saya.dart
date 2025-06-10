import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_buttom_nav.dart';
import '../widgets/custom_drawer.dart'; // ← Tambahkan ini

class PaketSayaPage extends StatefulWidget {
  const PaketSayaPage({super.key});

  @override
  State<PaketSayaPage> createState() => _PaketSayaPageState();
}

class _PaketSayaPageState extends State<PaketSayaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Paket Saya'),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          // Bagian search
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
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
          ),
          const SizedBox(height: 40),
          // Bagian konten (contoh: tampilan kosong)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/empty_cart.png',
                  height: 150,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Paket Belajar Anda Masih Kosong',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/riwayat');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/profil');
          }
        },
      ),
    );
  }
}
