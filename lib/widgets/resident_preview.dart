import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character.dart';
import 'package:rick_and_morty_app/screens/character_details_screen.dart';

class ResidentPreview extends StatelessWidget {
  final Character character;

  const ResidentPreview({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailsScreen(character: character),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              character.image,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
