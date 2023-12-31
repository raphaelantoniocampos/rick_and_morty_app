import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/constants.dart';
import 'package:rick_and_morty_app/screens/character_list_screen.dart';
import 'package:rick_and_morty_app/screens/episode_screen.dart';
import 'package:rick_and_morty_app/screens/location_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: "Characters"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_city,
                size: 30,
              ),
              label: "Locations"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.movie,
                size: 30,
              ),
              label: "Episodes"),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        currentIndex: _page,
      ),
    );
  }
}

List<Widget> pages = const [
  CharacterListScreen(),
  LocationListScreen(),
  EpisodeScreen(),
];
