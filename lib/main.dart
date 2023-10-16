import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/constants.dart';
import 'package:rick_and_morty_app/controllers/character_controller.dart';
import 'package:rick_and_morty_app/controllers/location_controller.dart';
import 'package:rick_and_morty_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (_) => CharacterController()
        ),
        ChangeNotifierProvider(
        create: (_) => LocationController()
        ),
        ],
        child: MaterialApp(
          title: 'Rick and Morty App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        ),
    );
  }
}