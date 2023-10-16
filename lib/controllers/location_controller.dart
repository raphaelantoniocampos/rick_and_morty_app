import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/models/location.dart';



class LocationController extends ChangeNotifier{
  List<dynamic> locations = [];

  Future<void> fetchLocations() async {
    try {
      debugPrint("Fetching Locations");
      final response = await http.get(Uri.parse("https://rickandmortyapi.com/api/location"));
      if (response.statusCode == 200){
        final jsonData = json.decode(response.body);
        List<dynamic> results = jsonData['results'];
        for(var result in results){
          Location location = Location.fromJson(result);
          locations.add(location);
        }
      }
    }
    catch (e) {
      debugPrint('Error while fetching characters: $e');
      locations.clear();
      notifyListeners();
      fetchLocations();
    }
  }
}