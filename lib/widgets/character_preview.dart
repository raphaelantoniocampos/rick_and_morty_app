import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/controllers/character_controller.dart';
import 'package:rick_and_morty_app/models/character.dart';
import 'package:rick_and_morty_app/screens/character_details_screen.dart';

class CharacterPreview extends StatelessWidget {
  final Character character;
  final CharacterController characterController;

  const CharacterPreview({
    super.key,
    required this.character,
    required this.characterController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailsScreen(
              character: character,
              characterController: characterController,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  character.image,
                  width: 180,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              character.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("${character.species}, ${character.status}"),
          ],
        ),
      ),
    );
  }
}
