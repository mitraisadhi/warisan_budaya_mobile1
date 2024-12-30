import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:warisan_budaya_mobile/blog_page.dart';
import 'package:warisan_budaya_mobile/main_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Fungsi untuk membuka URL Instagram
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Widget _buildCard(String imagePath, String name, String desc, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0), // Jarak antar card
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    desc,
                    style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              _buildCard(
                'assets/images/Barudak/daud.jpg',
                'Daud Ibrahim',
                '',
                'https://www.instagram.com/daudibr__/',
              ),
              _buildCard(
                'assets/images/Barudak/dhow2.jpg',
                'Ridho Dwi Nariori',
                '',
                'https://www.instagram.com/ridho.dnn/',
              ),
              _buildCard(
                'assets/images/Barudak/ibnu.jpg',
                'Ibnu Said Maulana',
                '',
                'https://www.instagram.com/ibnusaidmaulana/',
              ),
              _buildCard(
                'assets/images/Barudak/azril.jpg',
                'Muhammad Azril Hakim',
                '',
                'https://www.instagram.com/azriilhakiim/',
              ),
              _buildCard(
                'assets/images/Barudak/evan.jpg',
                'Revanza Permana',
                '',
                'https://www.instagram.com/vanzprmn/',
              ),
            ],
          ),
    );
  }
}
