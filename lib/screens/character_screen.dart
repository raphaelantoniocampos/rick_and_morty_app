import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/widgets/character_card.dart';
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
      setState(() {
        characters.addAll(jsonData['results']);
        currentPage++;

        // if(jsonData['info']['next'] != null){
        //   fetchCharacters();
        // }
      });
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.person, color: Colors.white,),
        actions: [Icon(Icons.search, color: Colors.white,),]
      ),
      body: ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index){
              final characterJson = characters[index];
              final character = Character.fromJson(characterJson);
              return CharacterCard(character: character);
            }
          ), 
    );
  }
}