import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/contants.dart';
import 'package:rick_and_morty_app/widgets/character_preview.dart';
import 'package:rick_and_morty_app/models/character.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<dynamic> characters = [];
  int currentPage = 40;


  @override
  void initState(){
    super.initState();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    // final apiUrl = 'https://rickandmortyapi.com/api/character?page=$currentPage';
    final response = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/character'),
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> results = jsonData['results'];

      for (var result in results){
        final characterUrl = result['url'];
        final characterResponse = await http.get(Uri.parse(characterUrl));

        if (characterResponse.statusCode == 200) {
          final characterJson = json.decode(characterResponse.body);
          final character = Character.fromJson(characterJson);
          setState(() {
            characters.add(character);
          });
        } else {
            throw Exception('Failed to load character');
          }
      }
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.person, color: primaryColor,),
        actions: [
          Icon(
            Icons.search, color: primaryColor,),
            ]
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Characters',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: characters.length,
              itemBuilder: (context, index){
                return CharacterPreview(character: characters[index]);
              }
            ),
          ),
        ],
      ), 
    );
  }
}