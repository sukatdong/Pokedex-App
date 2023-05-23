import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PokemonDetail extends StatefulWidget {
  final pokeDetail;
  final Color color;
  final int heroTag;

  const PokemonDetail(
      {Key? key, this.pokeDetail, required this.color, required this.heroTag})
      : super(key: key);
  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  String selectedTimezone = 'WIB';
  String currentTime = '';

  void getCurrentTime() {
    DateTime now = DateTime.now();

    switch (selectedTimezone) {
      case 'WIB':
        currentTime = DateFormat('HH:mm').format(now);
        break;
      case 'WIT':
        currentTime =
            DateFormat('HH:mm').format(now.subtract(Duration(hours: 1)));
        break;
      case 'WITA':
        currentTime =
            DateFormat('HH:mm').format(now.subtract(Duration(hours: 2)));
        break;
      case 'London':
        currentTime = DateFormat('HH:mm').format(now.add(Duration(hours: 7)));
        break;
    }
  }

  List<String> currencies = ['USD', 'PHP', 'BHD']; // dollar peso dinar
  String selectedCurrency = 'USD';

  double calculatePrice() {
    double weight = double.parse(widget.pokeDetail['weight'].split(' ')[0]);
    double height = double.parse(widget.pokeDetail['height'].split(' ')[0]);

    // Price formula: (weight in kg * 10) + (height in cm * 5)
    double price = (weight * 10) + (height * 5);

    return price;
  }

  String formatCurrency(double amount) {
    // Define the currency symbol based on the selected currency
    String symbol;
    switch (selectedCurrency) {
      case 'USD':
        symbol = '\$';
        break;
      case 'PHP':
        amount = amount * 55.7;
        symbol = '₱';
        break;
      case 'BHD':
        amount = amount * 0.38;
        symbol = 'BD';
        break;
      default:
        symbol = '';
    }

    // Format the amount using NumberFormat
    NumberFormat formatter = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: 2,
    );

    return formatter.format(amount);
  }

  String getHatchingTime() {
    // Menghitung waktu penetasan telur berdasarkan berat Pokémon
    double weight = double.parse(widget.pokeDetail['weight'].split(' ')[0]);
    int hatchingTime = (weight * 15).toInt();
    return '$hatchingTime minutes';
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            right: 25,
            child: Text(
              'Selected: $selectedTimezone',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 85,
            right: 10,
            child: DropdownButton<String>(
              value: selectedTimezone,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTimezone = newValue!;
                  getCurrentTime();
                });
              },
              dropdownColor: Colors.grey, // Warna background oranye
              items: <String>['WIB', 'WIT', 'WITA', 'London']
                  .map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          Positioned(
            top: 60,
            right: 25,
            child: Text(
              '$currentTime',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 5,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                )),
          ),
          Positioned(
              top: 90,
              left: 25,
              child: Text(widget.pokeDetail['name'],
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30))),
          Positioned(
              top: height * 0.18,
              right: -30,
              child: Image.asset(
                'images/pokeball.png',
                height: 200,
                fit: BoxFit.fitWidth,
              )),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            Container(
                                width: width * 0.3,
                                child: Text(widget.pokeDetail['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  'Height',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            Container(
                                width: width * 0.3,
                                child: Text(widget.pokeDetail['height'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  'Weight',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            Container(
                                width: width * 0.3,
                                child: Text(widget.pokeDetail['weight'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  'Spawn Time',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            Container(
                                width: width * 0.3,
                                child: Text(widget.pokeDetail['spawn_time'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  'Weakness',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            Container(
                                // width : width * 0.3,
                                child: Text(
                                    widget.pokeDetail['weaknesses'].join(', '),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  'Pre Form',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            widget.pokeDetail['prev_evolution'] != null
                                ? SizedBox(
                                    height: 20,
                                    width: width * 0.55,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget
                                          .pokeDetail['prev_evolution'].length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            right: 8.0,
                                          ),
                                          child: Text(
                                              widget.pokeDetail[
                                                      'prev_evolution'][index]
                                                  ['name'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        );
                                      },
                                    ),
                                  )
                                : Text('Just Hatched',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: width * 0.3,
                                child: Text(
                                  'Evolution',
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 16),
                                )),
                            widget.pokeDetail['next_evolution'] != null
                                ? SizedBox(
                                    height: 20,
                                    width: width * 0.55,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget
                                          .pokeDetail['next_evolution'].length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            right: 8.0,
                                          ),
                                          child: Text(
                                              widget.pokeDetail[
                                                      'next_evolution'][index]
                                                  ['name'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        );
                                      },
                                    ),
                                  )
                                : Text('Maxed Out',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Hatching Time',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            child: Text(
                              getHatchingTime(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Price',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.5,
                            child: Row(
                              children: [
                                DropdownButton<String>(
                                  value: selectedCurrency,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedCurrency = newValue!;
                                    });
                                  },
                                  items:
                                      currencies.map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  formatCurrency(calculatePrice()),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
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
            ),
          ),
          Positioned(
            top: 140,
            left: 20,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
                child: Text(widget.pokeDetail['type'].join(', '),
                    style: TextStyle(color: Colors.white)),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black26),
            ),
          ),
          Positioned(
            top: (height * 0.18),
            left: (width / 2) - 100,
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                imageUrl: widget.pokeDetail['img'],
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
