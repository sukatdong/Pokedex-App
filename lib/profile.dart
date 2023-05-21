import 'package:flutter/material.dart';
import 'package:ini_pokemon/login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: [
          IconButton(
            onPressed: () {
              // Logout dari aplikasi
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'images/pokeball.png',
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 160,
                      backgroundImage: AssetImage('images/profile.jpg'),
                    ),
                    SizedBox(height: 70),
                    Text(
                      'Hartanta Dwi Putra Sembiring',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'NIM: 123200037',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Kelas: TPM-IF-A',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Hobby: Berolahraga',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Cita-cita: Petani Berdasi',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman "Saran dan Kesan"
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FeedbackPage()),
                        );
                      },
                      child: Text('Saran dan Kesan'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saran dan Kesan'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Beri saran dan kesan mata kuliah Teknologi dan Pemrograman Mobile:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Saran dan kesan...',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Simpan saran dan kesan
                // ...
                // Kembali ke halaman sebelumnya
                Navigator.pop(context);
              },
              child: Text('Kirim'),
            ),
          ],
        ),
      ),
    );
  }
}
