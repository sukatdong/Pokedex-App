import 'package:flutter/material.dart';
import 'package:ini_pokemon/login.dart';
import 'package:hive/hive.dart';
import 'package:ini_pokemon/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'user.dart';

String boxUser = 'userbox';

String Username = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  await Hive.initFlutter();
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  await Hive.openBox<UserModel>(boxUser);
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
        home: isLoggedIn ? botnavbar() : Login(),
      //  home : Camera(),
      // home: HomePage(),
    );
  }
}
