import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'warisan.dart'; // Make sure Warisan is imported

class SharedPreferencesManager {
  
  late SharedPreferences prefs;

  static const WARISAN_LIST = 'warisan_list';

  Future<SharedPreferences> init() async {
    return prefs = await SharedPreferences.getInstance();
  }

  // Add a Warisan to SharedPreferences
  Future<void> addWarisan(Warisan warisan) async { 
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> warisanList = prefs.getStringList(WARISAN_LIST) ?? [];
    int lastId = warisanList.isEmpty ? 0 : jsonDecode(warisanList.last)['id'];
    warisan.id = lastId + 1;
    
    // Add the new Warisan as a JSON string
    warisanList.add(jsonEncode(warisan.toJson()));
    await prefs.setStringList(WARISAN_LIST, warisanList);
  }

  // Retrieve all Warisan items as a list
  Future<List<Warisan>> getWarisanList() async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> warisanList = prefs.getStringList(WARISAN_LIST) ?? [];
    if (warisanList.isEmpty) {
      await initializeDataFromJson();
      warisanList = prefs.getStringList(WARISAN_LIST) ?? [];
    }

    // Convert each JSON string back to a Warisan object
    return warisanList.map((warisanJson) {
      return Warisan.fromJson(jsonDecode(warisanJson));
    }).toList();
  }

  // Update a Warisan by ID
  Future<void> updateWarisan(Warisan updatedWarisan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> warisanList = prefs.getStringList(WARISAN_LIST) ?? [];

    // Find and update the Warisan
    for (int i = 0; i < warisanList.length; i++) {
      Map<String, dynamic> warisanData = jsonDecode(warisanList[i]);
      if (warisanData['id'] == updatedWarisan.id) {
        warisanList[i] = jsonEncode(updatedWarisan.toJson());
        await prefs.setStringList(WARISAN_LIST, warisanList);
        return;
      }
    }
  }

  // Delete a Warisan by ID
  Future<void> deleteWarisan(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> warisanList = prefs.getStringList(WARISAN_LIST) ?? [];

    // Remove the Warisan by ID
    warisanList.removeWhere((warisanJson) {
      Map<String, dynamic> warisanData = jsonDecode(warisanJson);
      return warisanData['id'] == id;
    });

    // Save the updated list back to SharedPreferences
    await prefs.setStringList(WARISAN_LIST, warisanList);
  }

  // Initialize the SharedPreferences with sample data from a JSON file
  Future<void> initializeDataFromJson() async {
    final String jsonString = await rootBundle.loadString('assets/json/warisan_data.json');
    final List<dynamic> warisanJsonList = jsonDecode(jsonString);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> warisanList = prefs.getStringList(WARISAN_LIST) ?? [];

    // Add each Warisan item if it's not already present
    for (var warisanJson in warisanJsonList) {
      Warisan warisan = Warisan.fromJson(warisanJson);
      if (!warisanList.contains(jsonEncode(warisan.toJson()))) {
        warisanList.add(jsonEncode(warisan.toJson()));
      }
    }

    await prefs.setStringList(WARISAN_LIST, warisanList);
  }

  Future<void> login(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (username == "admin" && password == "admin") {
      await prefs.setBool("isLoggedId", true);
    }
    print(await prefs.getBool("isLoggedId"));
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedId", false);
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = await prefs.getBool("isLoggedId") ?? false;
    return isLoggedIn;
  }
}
