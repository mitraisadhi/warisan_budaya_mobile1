import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warisan_budaya_mobile/add_blog_screen.dart';
import 'package:warisan_budaya_mobile/dashboard_screen.dart';
import 'package:warisan_budaya_mobile/login_page.dart';
import 'package:warisan_budaya_mobile/splash_screen.dart';
import 'package:warisan_budaya_mobile/blog_detail_page.dart';
import 'package:warisan_budaya_mobile/data/shared_preference_manager.dart';

void main() async {
  MyApp app = MyApp();
  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();
  // await sharedPreferencesManager.init();

  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => SplashScreen());
          case '/dashboard':
            return MaterialPageRoute(builder: (context) => DashboardScreen());
          case '/detail':
            final args = settings.arguments as Map<String, String>;
            return MaterialPageRoute(
              builder: (context) => BlogDetailPage(
                  image: args['image']!,
                  name: args['name']!,
                  location: args['location']!,
                  description: args['description']!,
                  image2: args['image2']!,
                  description2: args['description2']!,
                  image3: args['image3']!,
                  description3: args['description3']!),
            );
          case '/add':
            return MaterialPageRoute(builder: (context) => AddBlogScreen());
          case '/login':
            return MaterialPageRoute(builder: (context) => LoginPage());
          default:
            MaterialPageRoute(builder: (context) => DashboardScreen());
        }
      },
      initialRoute: '/',
    );
  }
}
