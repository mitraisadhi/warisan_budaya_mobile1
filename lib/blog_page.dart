import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warisan_budaya_mobile/data/Warisan.dart';
import 'package:warisan_budaya_mobile/data/shared_preference_manager.dart';
import 'package:warisan_budaya_mobile/main_page.dart';
import 'package:warisan_budaya_mobile/ProfileScreen.dart';
import 'blog_detail_page.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  int _selectedIndex = 1;
  final TextEditingController _searchController = TextEditingController();
  // List<Warisan> _warisanListFuture = [];
  List<Map<String, String>> displayedData = [];
  late Future<List<Warisan>> _warisanListFuture;

  @override
  void initState() {
    super.initState();
  
    _warisanListFuture = SharedPreferencesManager.getWarisanList();
    // displayedData = List.from(_warisanListFuture); // Awalnya tampilkan semua data
    _searchController.addListener(_filterSearchResults);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterSearchResults() {
    String query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        displayedData = List.from(_warisanListFuture); // Show all data if query is empty
      } else {
        displayedData = data.where((item) {
          final name = item['name']!.toLowerCase();
          final location = item['location']!.toLowerCase();
          return name.contains(query) || location.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari berdasarkan nama atau lokasi...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: displayedData.length,
                  itemBuilder: (context, index) {
                    final item = displayedData[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogDetailPage(
                              image: item['image']!,
                              name: item['name']!,
                              location: item['location']!,
                              description: item['description']!,
                              image2: item['image2']!,
                              description2: item['description2']!,
                              image3: item['image3']!,
                              description3: item['description3']!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              child: Image.asset(
                                item['image']!,
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name']!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    item['location']!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    item['description']!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
