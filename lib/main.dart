import 'package:flutter/material.dart';
import 'package:app_pertamaku/pages/login_page.dart';
import 'package:app_pertamaku/pages/home_page.dart';
import 'package:app_pertamaku/pages/riwayat_page.dart';
import 'package:app_pertamaku/pages/profil_page.dart';
import 'package:app_pertamaku/pages/register_page.dart';
import 'package:app_pertamaku/pages/paket_saya.dart';
import 'package:app_pertamaku/pages/customer_service.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Super App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

      // ✅ Halaman awal langsung ke Login
      home: const LoginPage(), // const LoginPage(),

      // ✅ Semua route disiapkan untuk navigasi
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/riwayat': (context) => const RiwayatPage(),
        '/paket_saya': (context) => const PaketSayaPage(),
        '/profil': (context) => const ProfilePage(),
        '/register': (context) => const RegisterPage(),
        '/customer_service': (context) => const CustomerServicePage(),
      },
    );
  }
}
