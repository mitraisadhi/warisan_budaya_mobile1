import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warisan_budaya_mobile/blog_detail_page.dart';
import 'package:warisan_budaya_mobile/data/shared_preference_manager.dart';
import 'package:warisan_budaya_mobile/data/warisan.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();

  final TextEditingController _searchController = TextEditingController();
  List<Warisan> warisanData = [];
  List<Warisan> filteredData = [];
  var isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    loadWarisan();
    checkIsUserLoggedIn();
    _searchController.addListener(_filterSearchResults);
  }

  void checkIsUserLoggedIn() async {
    var isLogin = await sharedPreferencesManager.isLoggedIn();
    setState(() {
      isLoggedIn = isLogin;
    });
  }

  void _deleteItem(int id) async {
    await sharedPreferencesManager.deleteWarisan(id);
    loadWarisan();
  }

  void _filterSearchResults() {
    String query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        filteredData = warisanData; // Show all data if query is empty
      } else {
        filteredData = warisanData.where((item) {
          final name = item.name.toLowerCase();
          final location = item.location.toLowerCase();
          return name.contains(query) || location.contains(query);
        }).toList();
      }
    });
  }

  Future<void> loadWarisan() async {
    List<Warisan> loadedData = await sharedPreferencesManager.getWarisanList();
    setState(() {
      warisanData = loadedData;
      filteredData = warisanData;
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
                  itemCount: filteredData.length,
                  itemBuilder: (context, index) {
                    final item = filteredData[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogDetailPage(
                              image: item.image,
                              name: item.name,
                              location: item.location,
                              description: item.description,
                              image2: item.image2,
                              description2: item.description2,
                              image3: item.image3,
                              description3: item.description3,
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
                              child: Image.network(
                                item.image,
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
                                    item.name,
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    item.location,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    item.description,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            isLoggedIn
                                ? Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          _deleteItem(item.id);
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          _deleteItem(item.id);
                                        },
                                      )
                                    ],
                                  )
                                : Container(),
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
      floatingActionButton: isLoggedIn
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add');
              },
              child: Icon(Icons.add),
            )
          : Container(),
    );
  }
}
