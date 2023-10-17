import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/controllers/location_controller.dart';
import 'package:rick_and_morty_app/widgets/character_preview.dart';
import 'package:rick_and_morty_app/widgets/info_text.dart';
import 'package:rick_and_morty_app/widgets/resident_preview.dart';

import '../constants.dart';
import '../models/location.dart';

class LocationDetailsScreen extends StatefulWidget {
  final Location location;

  const LocationDetailsScreen({super.key, required this.location});

  @override
  State<LocationDetailsScreen> createState() => _LocationDetailsScreenState();
}

class _LocationDetailsScreenState extends State<LocationDetailsScreen> {
  late LocationController _locationController;

  @override
  void didChangeDependencies() {
    _locationController = Provider.of<LocationController>(context);
    _locationController.fetchResidents(widget.location.residents);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.location.name!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: Colors.black12,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      InfoText(
                        firstText: "Type",
                        firstColor: Colors.pinkAccent,
                        secondText: widget.location.type!,
                        secondColor: Colors.green,
                      ),
                      InfoText(
                        firstText: "Dimension",
                        firstColor: Colors.pinkAccent,
                        secondText: widget.location.dimension!,
                        secondColor: Colors.green,
                      ),
                      InfoText(
                        firstText: "Created",
                        firstColor: Colors.pinkAccent,
                        secondText: widget.location.created!,
                        secondColor: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Residents: ",
                style: TextStyle(color: Colors.pinkAccent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _locationController.residents.length,
                    itemBuilder: (context, index) {
                      final character = _locationController.residents[index];
                      return ResidentPreview(character: character);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
