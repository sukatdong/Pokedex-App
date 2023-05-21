import 'package:flutter/material.dart';

class AboutApplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Application'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/pokemerah.png',
              width: 120,
              height: 120,
            ),
            SizedBox(height: 24),
            Text(
              'Pokédex',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Pokédex (ポケモン図鑑 Pokemon Zukan, "Pokémon Encyclopedia") '
                  'is a concept in the Pokémon games, which is a handheld electronic '
                  'device used by players to identify the species of Pokémon they encounter.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Text(
              'About This App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'This Pokédex app is designed to provide information about various Pokémon species. '
                  'You can search and explore different Pokémon, view their details, including their '
                  'types, abilities, evolutions, and more. It also allows you to add your favorite Pokémon '
                  'to your collection for quick access. Enjoy your Pokémon journey!',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
