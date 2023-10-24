import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/constants.dart';
import 'package:rick_and_morty_app/widgets/character_preview.dart';
import 'package:rick_and_morty_app/controllers/character_controller.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterListScreen> {
  late CharacterController _characterController;

  @override
  void didChangeDependencies() {
    _characterController = Provider.of<CharacterController>(context);
    _characterController.fetchCharacters();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(
            Icons.person,
            color: primaryColor,
          ),
          actions: [
            Icon(
              Icons.search,
              color: primaryColor,
            ),
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                itemCount: _characterController.characters.length,
                itemBuilder: (context, index) {
                  final character = _characterController.characters[index];
                  return CharacterPreview(
                    character: character,
                    characterController: _characterController,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
