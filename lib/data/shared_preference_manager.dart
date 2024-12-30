import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'warisan.dart'; // Make sure Warisan is imported

class SharedPreferencesManager {
  
  late SharedPreferences prefs;

  Future<SharedPreferences> init() async {
    return prefs = await SharedPreferences.getInstance();
  }

  // Add a Warisan to SharedPreferences
  Future<void> addWarisan(Warisan warisan) async {
    List<String> warisanList = prefs.getStringList('warisan_list') ?? [];
    int lastId = warisanList.isEmpty ? 0 : jsonDecode(warisanList.last)['id'];
    warisan.id = lastId + 1;
    
    // Add the new Warisan as a JSON string
    warisanList.add(jsonEncode(warisan.toJson()));
    await prefs.setStringList('warisan_list', warisanList);
  }

  // Retrieve all Warisan items as a list
  Future<List<Warisan>> getWarisanList() async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> warisanList = prefs.getStringList('warisan_list') ?? [];
    if (warisanList.isEmpty) {
      await initializeDataFromJson();
      warisanList = prefs.getStringList('warisan_list') ?? [];
    }

    // Convert each JSON string back to a Warisan object
    return warisanList.map((warisanJson) {
      return Warisan.fromJson(jsonDecode(warisanJson));
    }).toList();
  }

  // Update a Warisan by ID
  static Future<void> updateWarisan(Warisan updatedWarisan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> warisanList = prefs.getStringList('warisan_list') ?? [];

    // Find and update the Warisan
    for (int i = 0; i < warisanList.length; i++) {
      Map<String, dynamic> warisanData = jsonDecode(warisanList[i]);
      if (warisanData['id'] == updatedWarisan.id) {
        warisanList[i] = jsonEncode(updatedWarisan.toJson());
        await prefs.setStringList('warisan_list', warisanList);
        return;
      }
    }
  }

  // Delete a Warisan by ID
  static Future<void> deleteWarisan(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> warisanList = prefs.getStringList('warisan_list') ?? [];

    // Remove the Warisan by ID
    warisanList.removeWhere((warisanJson) {
      Map<String, dynamic> warisanData = jsonDecode(warisanJson);
      return warisanData['id'] == id;
    });

    // Save the updated list back to SharedPreferences
    await prefs.setStringList('warisan_list', warisanList);
  }

  // Initialize the SharedPreferences with sample data from a JSON file
  Future<void> initializeDataFromJson() async {
    final String jsonString = await rootBundle.loadString('assets/json/warisan_data.json');
    final List<dynamic> warisanJsonList = jsonDecode(jsonString);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> warisanList = prefs.getStringList('warisan_list') ?? [];

    // Add each Warisan item if it's not already present
    for (var warisanJson in warisanJsonList) {
      Warisan warisan = Warisan.fromJson(warisanJson);
      if (!warisanList.contains(jsonEncode(warisan.toJson()))) {
        warisanList.add(jsonEncode(warisan.toJson()));
      }
    }

    await prefs.setStringList('warisan_list', warisanList);
  }
}
