import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/constants.dart';
import 'package:rick_and_morty_app/controllers/location_controller.dart';
import 'package:rick_and_morty_app/screens/location_details_screen.dart';

class LocationListScreen extends StatefulWidget {
  const LocationListScreen({super.key});

  @override
  State<LocationListScreen> createState() => _LocationListScreenState();
}

class _LocationListScreenState extends State<LocationListScreen> {
  late LocationController _locationController;

  @override
  void didChangeDependencies() {
    _locationController = Provider.of<LocationController>(context);
    _locationController.fetchLocations();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.location_city,
            color: primaryColor,
          ),
          actions: [
            Icon(
              Icons.search,
              color: primaryColor,
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Locations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: _locationController.locations.length,
                itemBuilder: (context, index) {
                  final location = _locationController.locations[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LocationDetailsScreen(location: location)));
                    },
                    child: ListTile(
                      title: Text('${location.name}'),
                      subtitle: Text('${location.type}'),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
