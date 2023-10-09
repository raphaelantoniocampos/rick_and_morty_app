import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Image.network(character.image),
          Text(character.name),
          Text("${character.species}, ${character.status}"),
        ],
      ),
    );
  }
}