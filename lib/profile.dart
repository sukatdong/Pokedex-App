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
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          children: [
            ProfileTanta(),
            SizedBox(height: 20), // Add some spacing between the cards
            ProfileViery(),
          ],
        ),
      ),
    );
  }
}

class ProfileTanta extends StatelessWidget {
  const ProfileTanta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/pokeball.png',
          fit: BoxFit.cover,
        ),
        Container(
          margin: EdgeInsets.only(top: 55.0),
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
                'Kelas: Prak.TPM-IF-E',
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
              // ElevatedButton(
              //   onPressed: () {
              //     // Navigasi ke halaman "Saran dan Kesan"
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => FeedbackPage()),
              //     );
              //   },
              //   child: Text('Saran dan Kesan'),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileViery extends StatelessWidget {
  const ProfileViery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/pokeball.png',
          fit: BoxFit.cover,
        ),
        Container(
          margin: EdgeInsets.only(top: 55.0),
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 160,
                backgroundImage: AssetImage('images/viery.jpg'),
              ),
              SizedBox(height: 70),
              Text(
                'Viery Abdirohman',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'NIM: 123200048',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Kelas: Prak.TPM-IF-E',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Hobby: Desain',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Cita-cita: Presiden',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              // ElevatedButton(
              //   onPressed: () {
              //     // Navigasi ke halaman "Saran dan Kesan"
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => FeedbackPage()),
              //     );
              //   },
              //   child: Text('Saran dan Kesan'),
              // ),
            ],
          ),
        ),
      ],
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
        // color: Colors.grey,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Image.asset(
              'images/poko.png', // Ganti dengan path gambar pokemon Anda
              width: 100, // Sesuaikan lebar gambar sesuai kebutuhan
            ),
            SizedBox(height: 10), // Jarak antara gambar dan teks
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200], // Warna latar belakang teks
              ),
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Dosen yang menyenangkan dan penuh semangat saat mengajar. Materi yang jelas dan menarik, membuat saya semangat belajar. Tugasnya Banyak dan Ramai membuat saya harus terus berlatih membuat aplikasi sehingga saya sering begadang. Pesan untuk tetap semangat dan sehat selalu. Terima kasih,',
                  style: TextStyle(
                    fontSize: 20, // Ukuran font lebih besar
                    fontWeight: FontWeight.bold, // Font bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
