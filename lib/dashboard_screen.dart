import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warisan_budaya_mobile/home_screen.dart';
import 'package:warisan_budaya_mobile/profile_screen.dart';
import 'package:warisan_budaya_mobile/blog_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    BlogScreen(),
    ProfileScreen(),
  ];

  final List<String> _titles = [
    'Home',
    'Menu',
    'Profile',
  ];

  void login() {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Warisan',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'Budaya',
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.verified_user_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              login();
            },
          )
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Indeks item yang dipilih
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        }, // Fungsi untuk menangani item yang dipilih
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon Beranda
            label: 'Beranda', // Label Beranda
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article), // Ikon Blog
            label: 'Blog', // Label Blog
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Tentang Kami',
          ),
        ],
        selectedItemColor: Colors.red, // Warna item yang dipilih
        unselectedItemColor: Colors.grey, // Warna item yang tidak dipilih
        showUnselectedLabels:
            true, // Menampilkan label untuk item yang tidak dipilih
        backgroundColor: Colors.black,
      ),
    );
  }
}
