import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character.dart';

class CharacterPreview extends StatelessWidget {
  final Character character;

  const CharacterPreview({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text(character.name, style: const TextStyle(
            fontWeight: FontWeight.bold
          ),),
          Text("${character.species}, ${character.status}"),
        ],
      ),
    );
  }
}