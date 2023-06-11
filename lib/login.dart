import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ini_pokemon/encrypt.dart';
import 'package:ini_pokemon/navbar.dart';
import 'main.dart';
import 'register.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Box<UserModel> _myBox;
  late SharedPreferences _prefs;
  bool _rememberMe = false;

  final _formKey = GlobalKey<FormState>();
  String _inputUsername = "";
  String _inputPassword = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _openBox();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _prefs = prefs;
      });
    });
  }

  void _openBox() async {
    await Hive.openBox<UserModel>(boxUser);
    _myBox = Hive.box<UserModel>(boxUser);
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();

      if (!_myBox.containsKey(_inputUsername)) {
        // Check if username exists during login
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username')),
        );
        return;
      }

      final user = _myBox.get(_inputUsername);
      final dekripsi = EncryptData.decryptAES(user!.password);
      if (_inputPassword == dekripsi) {
        setState(() {
          Username = _inputUsername;
        });
        // Save user's session
        if (_rememberMe) {
          _prefs.setBool('isLoggedIn', true);
          _prefs.setString('username', _inputUsername);
        } else {
          _prefs.remove('isLoggedIn');
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => botnavbar()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid username or password')),
        );
      }
    }
  }

  void _register() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Register(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Image.asset(
                'images/pika.png',
                // fit: BoxFit.cover,
                width: 350, // ukuran lebar baru
                height: 350, // ukuran tinggi baru
              ),

              SizedBox(height: 5.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a username' : null,
                onSaved: (value) => _inputUsername = value!.toLowerCase(),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a password' : null,
                onSaved: (value) => _inputPassword = value!,
                obscureText: _obscureText,
              ),
              SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Login'),
              ),
              // SizedBox(height: 4.0),

              // SizedBox(height: 5.0),
              Center(child: Text("Don't have an account?")),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: _register,
                child: Text('Create Account'),
                style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.teal,
                    ),
              ),
              CheckboxListTile(
                title: Text("Remember me"),
                value: _rememberMe,
                onChanged: (newValue) {
                  setState(() {
                    _rememberMe = newValue!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
