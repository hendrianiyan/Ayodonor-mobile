import 'package:flutter/material.dart';
import 'main.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF44236), // Warna background F44236
        centerTitle: true, // Menempatkan teks di tengah
        toolbarHeight: 85,
        title: Text(
          'Event',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Warna teks menjadi putih
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: HomeContent(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set initial index to 2 for HOME
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            ),
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outlined),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'FAQ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Channel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Colors.black, // Warna ikon yang dipilih
        unselectedItemColor: Colors.black, // Warna ikon yang tidak dipilih
        selectedLabelStyle:
            TextStyle(color: Colors.black), // Warna label yang dipilih
        unselectedLabelStyle:
            TextStyle(color: Colors.black), // Warna label yang tidak dipilih
        backgroundColor: Colors.white, // Background warna putih
        type: BottomNavigationBarType.fixed, // Label selalu ditampilkan
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/White.png', // Path ke gambar background
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: Column(
                children: [
                  _buildEventCard(
                    context,
                    title: 'Kampanye Hari Aksi Panas',
                    location: 'Depok',
                    image: 'assets/Surabaya.png',
                    description:
                        'Event kampanye yang diadakan oleh PMI kota Depok ini ditujukan untuk edukasi gerakan Go green pada tanggal 02 Juni 2024 di Taman Bungkul, kec.Wonokromo.',
                  ),
                  _buildEventCard(
                    context,
                    title: 'Lomba Traveling Kepalangmerahan',
                    location: 'Jakarta',
                    image: 'assets/jakarta.png',
                    description:
                        'Event Lomba Traveling Kepalangmerahan yang diadakan oleh PMI kota Jakarta ini ditujukan untuk edukasi gerakan Go green pada tanggal 15 Juli 2024 di Monas, Jakarta Pusat.',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Ayo Cari Event di Kotamu...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(BuildContext context,
      {required String title,
      required String location,
      required String image,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Set background color to white
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/pmikecil.png'),
                    radius: 20,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(location),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 167, // Set the height of the image
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Divider(color: Colors.black),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
