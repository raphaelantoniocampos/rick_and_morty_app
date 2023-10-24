import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:palette_generator/palette_generator.dart';
import 'package:rick_and_morty_app/models/character.dart';

class CharacterController extends ChangeNotifier {
  List<dynamic> characters = [];
  int currentPage = 40;

  //TODO: Pegar todos os personagens
  Future<void> fetchCharacters() async {
    try {
      final response = await http.get(
        Uri.parse("https://rickandmortyapi.com/api/character"),
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<dynamic> results = jsonData['results'];
        List<dynamic> charactersList = [];
        for (var result in results) {
          Character character = Character.fromJson(result);
          charactersList.add(character);
        }
        characters.addAll(charactersList);
      }
    } catch (e) {
      debugPrint('Error while fetching characters: $e');
      characters.clear();
      // fetchCharacters();
    }
    notifyListeners();
  }

  Future<Color> getColor(String image) async {
    final PaletteGenerator paletteGenerator =
    await PaletteGenerator.fromImageProvider(
      Image.network(image).image,
    );
    return paletteGenerator.dominantColor!.color.withOpacity(0.3);
  }

}
