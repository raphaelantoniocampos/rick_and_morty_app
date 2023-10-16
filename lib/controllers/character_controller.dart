import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:palette_generator/palette_generator.dart';
import 'package:rick_and_morty_app/models/character.dart';

class CharacterController extends ChangeNotifier{
  List<dynamic> characters = [];
  int currentPage = 40;


  Future<void> fetchCharacters() async {
    try {
      debugPrint("Fetching Characters");
      final response = await http.get(Uri.parse("https://rickandmortyapi.com/api/character"));
      if (response.statusCode == 200){
        final jsonData = json.decode(response.body);
        List<dynamic> results = jsonData['results'];
        for(var result in results){
          Character character = Character.fromJson(result);
          characters.add(character);
        }
      }
    }
    catch (e) {
      debugPrint('Error while fetching characters: $e');
      characters.clear();
      notifyListeners();
      fetchCharacters();
    }
  }

  Future<Color?> getCharacterPrimaryColor(image) async {
    final PaletteGenerator paletteGenerator =
    await PaletteGenerator.fromImageProvider(
      Image.network(image).image,
    );
    return paletteGenerator.dominantColor?.color.withOpacity(0.3);
  }

  
} 