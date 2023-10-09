import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/character.dart';
import 'package:palette_generator/palette_generator.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character character;
  const CharacterDetailsScreen({super.key, required this.character});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  PaletteGenerator? _paletteGenerator;


  @override
  void initState() {
    super.initState();
    _generatePalette();
  }

  Future<void> _generatePalette() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      Image.network(widget.character.image).image,
    );
    setState(() {
      _paletteGenerator = paletteGenerator;
    });
  }

  Color? get characterPrimaryColor =>
      _paletteGenerator?.dominantColor?.color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: characterPrimaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: characterPrimaryColor
        ),
        child: Column(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white38,
                  width: 1,
                )
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.character.image),
              ),
            ),
              ),
          const SizedBox(
            height: 15,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.character.name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white38,
                        width: 2,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Text(
                          widget.character.name, 
                          style: const TextStyle(
                            fontSize: 90,
                            fontWeight: FontWeight.bold,
                            color: Colors.white12
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InfoText(firstText: "Status", secondText: widget.character.status),
                              InfoText(firstText: "species", secondText: widget.character.species),
                              InfoText(firstText: "Gender", secondText: widget.character.gender),
                              InfoText(firstText: "Origin", secondText: widget.character.origin.name),
                              InfoText(firstText: "Location", secondText: widget.character.location.name),
                              InfoText(firstText: "First episode", secondText: widget.character.episode[0]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ]
      ),
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  final String firstText;
  final String secondText;
  const InfoText({super.key, required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        "$firstText: ${secondText}",
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}