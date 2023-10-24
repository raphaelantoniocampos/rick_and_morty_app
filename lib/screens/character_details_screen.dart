import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:rick_and_morty_app/models/character.dart';
import 'package:rick_and_morty_app/widgets/info_text.dart';

import '../controllers/character_controller.dart';

class CharacterDetailsScreen extends StatefulWidget {
  final Character character;
  final CharacterController? characterController;

  const CharacterDetailsScreen({
    super.key,
    required this.character,
    required this.characterController,
  });

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  late Future<Color> characterPrimaryColor;

  @override
  void initState() {
    super.initState();
    characterPrimaryColor = getColor();
  }

  Future<Color> getColor() async {
    return widget.characterController!.getColor(widget.character.image);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Color>(
        future: characterPrimaryColor,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: snapshot.data,
              ),
              body: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(color: snapshot.data),
                  ),
                  SingleChildScrollView(
                    child: Column(children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white38,
                                width: 1,
                              )),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(widget.character.image),
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
                                  fontSize: 30, fontWeight: FontWeight.w500),
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
                                        color: Colors.white12),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 30),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        InfoText(
                                          firstText: "Status",
                                          firstColor: Colors.black,
                                          secondText: widget.character.status,
                                          secondColor: Colors.black,
                                        ),
                                        InfoText(
                                          firstText: "species",
                                          firstColor: Colors.black,
                                          secondText: widget.character.species,
                                          secondColor: Colors.black,
                                        ),
                                        InfoText(
                                          firstText: "Gender",
                                          firstColor: Colors.black,
                                          secondText: widget.character.gender,
                                          secondColor: Colors.black,
                                        ),
                                        InfoText(
                                          firstText: "Origin",
                                          firstColor: Colors.black,
                                          secondText:
                                          widget.character.origin.name!,
                                          secondColor: Colors.black,
                                        ),
                                        InfoText(
                                          firstText: "Location",
                                          firstColor: Colors.black,
                                          secondText:
                                          widget.character.location.name!,
                                          secondColor: Colors.black,
                                        ),
                                        InfoText(
                                          firstText: "First episode",
                                          firstColor: Colors.black,
                                          secondText:
                                          "widget.character.episode[0]",
                                          secondColor: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
