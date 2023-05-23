import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ini_pokemon/pokemonDetail.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String search = '';

class _HomePageState extends State<HomePage> {
  var pokedexApi =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  late List<dynamic> pokedex = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (mounted) {
      fetchPokemonData();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        // backgroundColor: Colors.orangeAccent,
        body: Stack(
      children: [
        Positioned(
          top: -50,
          right: -50,
          child: Image.asset(
            'images/pokeball.png',
            width: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          top: -30,
          right: -30,
          child: Image.asset(
            'images/pokemerah.png',
            width: 160,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          top: 80,
          left: 20,
          child: Stack(
            children: [
              // Teks dengan outline orange
              Text(
                "Pokedex",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.orange,
                ),
              ),
              // Teks utama
              Text(
                "Pokedex",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 110,
          child: Container(
            width: width,
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: InkWell(
                  onTap: () {
                    fetchPokemonData();
                  },
                  child: Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(
                      color: Colors.pink), // Ubah warna outline di sini
                ),
                // filled: true,
                // fillColor: Colors.green, // Ubah warna fill di sini
              ),
              onChanged: (value) {
                setState(() {
                  search = value.toLowerCase();
                });
                print(value);
              },
            ),
          ),
        ),
        Positioned(
          top: 180,
          bottom: 0,
          width: width,
          child: Column(
            children: [
              pokedex.length != null
                  ? Expanded(
                      child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1.4),
                      itemCount: pokedex.length,
                      itemBuilder: (context, index) {
                        var type = pokedex[index]['type'][0];
                        return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  // color: Colors.green,
                                  color: type == 'Grass'
                                      ? Colors.greenAccent
                                      : type == 'Fire'
                                          ? Colors.redAccent
                                          : type == 'Water'
                                              ? Colors.blue
                                              : type == 'Electric'
                                                  ? Colors.yellow
                                                  : type == 'Rock'
                                                      ? Colors.grey
                                                      : type == 'Ground'
                                                          ? Colors.brown
                                                          : type == 'Psychic'
                                                              ? Colors.indigo
                                                              : type ==
                                                                      'Fighting'
                                                                  ? Colors
                                                                      .orange
                                                                  : type ==
                                                                          'Bug'
                                                                      ? Colors
                                                                          .lightGreen
                                                                      : type ==
                                                                              'Ghost'
                                                                          ? Colors
                                                                              .deepPurple
                                                                          : type == 'Normal'
                                                                              ? Colors.black26
                                                                              : type == 'Poison'
                                                                                  ? Colors.deepPurpleAccent
                                                                                  : Colors.pink,
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: Stack(
                                children: [
                                  Positioned(
                                      bottom: -10,
                                      right: -10,
                                      child: Image.asset(
                                        'images/pokeball.png',
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      )),
                                  Positioned(
                                    top: 20,
                                    left: 10,
                                    child: Text(
                                      pokedex[index]['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Positioned(
                                    top: 45,
                                    left: 20,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0,
                                            right: 8.0,
                                            top: 4,
                                            bottom: 4),
                                        child: Text(
                                          type.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.black26,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 80,
                                    left: 20,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        pokedex[index]['num'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        color: Colors.black26,
                                      ),
                                      width: 50,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 3,
                                    child: Hero(
                                      tag: index,
                                      child: CachedNetworkImage(
                                        imageUrl: pokedex[index]['img'],
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => PokemonDetail(
                                          pokeDetail: pokedex[index],
                                          color: type == 'Grass'
                                              ? Colors.greenAccent
                                              : type == 'Fire'
                                                  ? Colors.redAccent
                                                  : type == 'Water'
                                                      ? Colors.blue
                                                      : type == 'Electric'
                                                          ? Colors.yellow
                                                          : type == 'Rock'
                                                              ? Colors.grey
                                                              : type == 'Ground'
                                                                  ? Colors.brown
                                                                  : type ==
                                                                          'Psychic'
                                                                      ? Colors
                                                                          .indigo
                                                                      : type ==
                                                                              'Fighting'
                                                                          ? Colors
                                                                              .orange
                                                                          : type == 'Bug'
                                                                              ? Colors.lightGreen
                                                                              : type == 'Ghost'
                                                                                  ? Colors.deepPurple
                                                                                  : type == 'Normal'
                                                                                      ? Colors.grey
                                                                                      : type == 'Poison'
                                                                                          ? Colors.deepPurpleAccent
                                                                                          : Colors.pink,
                                          heroTag: index,
                                        )));
                          },
                        );
                      },
                    ))
                  : Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ),
      ],
    ));
  }

  void fetchPokemonData() {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodedJsonData = jsonDecode(value.body);
        pokedex = decodedJsonData['pokemon'];

        if (search.isNotEmpty) {
          List<dynamic> filteredPokedex = pokedex
              .where((element) =>
                  element['name'].toString().toLowerCase().contains(search))
              .toList();
          pokedex = filteredPokedex;
        }

        print('halo');
        setState(() {
          // Update your state variables or UI based on the filtered pokedex
        });
      }
    });
  }
}
