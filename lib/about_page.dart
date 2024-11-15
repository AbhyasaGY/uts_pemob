import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final String instagramUrl = 'https://www.instagram.com/abhyasagnwn/';
  final String twitterUrl = 'https://twitter.com/abiabzu';
  final String discordUrl = 'https://discord.gg/ruTTnw7';
  final String spotifyUrl = 'https://open.spotify.com/user/2a78rtx6ppgut4e15ae0cocvm';
  final String steamUrl = 'https://steamcommunity.com/id/abiabzu';

  String? _selectedValue = 'thank you'; // Default value for dropdown

  // Fungsi untuk membuka tautan
  void openLink(String url) async {
    print("Membuka $url"); // Ganti dengan kode untuk membuka URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Me", style: TextStyle(fontFamily: 'Poppins')),
        backgroundColor: Colors.transparent, // Menghilangkan warna biru
        elevation: 0, // Menghilangkan bayangan app bar
      ),
      body: Container(
        color: Colors.white, // Menetapkan latar belakang menjadi putih
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto Profil dari assets
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/img.png'), // Ganti dengan nama file gambar profil Anda
            ),
            SizedBox(height: 16),
            // Info Profil
            Text('Nama: Abhyasa Gunawan Yusuf', style: TextStyle(fontSize: 20, fontFamily: 'Poppins')),
            Text('NRP: 152022087', style: TextStyle(fontSize: 18, fontFamily: 'Poppins')),
            Text('Email: abiabzu10@gmail.com', style: TextStyle(fontSize: 18, fontFamily: 'Poppins')),
            SizedBox(height: 20),
            Text('Social Links:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Poppins')),
            SizedBox(height: 10),
            // Daftar Link Sosial dengan ikon dari assets
            ListTile(
              title: Text('abhyasagnwn', style: TextStyle(fontFamily: 'Poppins')),
              leading: Image.asset('assets/images/instagram.png', width: 30, height: 30),
              onTap: () => openLink(instagramUrl),
            ),
            ListTile(
              title: Text('abiabzu', style: TextStyle(fontFamily: 'Poppins')),
              leading: Image.asset('assets/images/x.png', width: 30, height: 30),
              onTap: () => openLink(twitterUrl),
            ),
            ListTile(
              title: Text('unLogic Server', style: TextStyle(fontFamily: 'Poppins')),
              leading: Image.asset('assets/images/discord.png', width: 30, height: 30),
              onTap: () => openLink(discordUrl),
            ),
            ListTile(
              title: Text('abiabzu', style: TextStyle(fontFamily: 'Poppins')),
              leading: Image.asset('assets/images/spotify.png', width: 30, height: 30),
              onTap: () => openLink(spotifyUrl),
            ),
            ListTile(
              title: Text('ayrton', style: TextStyle(fontFamily: 'Poppins')),
              leading: Image.asset('assets/images/steam.png', width: 30, height: 30),
              onTap: () => openLink(steamUrl),
            ),
            SizedBox(height: 20),
            // Dropdown untuk "thank you" dan "terimakasih"
            Text('Choose your expression:', style: TextStyle(fontSize: 16, fontFamily: 'Poppins')),
            DropdownButton<String>(
              value: _selectedValue,
              icon: Icon(Icons.arrow_downward),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
              },
              items: <String>['thank you', 'terimakasih']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontFamily: 'Poppins')),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
