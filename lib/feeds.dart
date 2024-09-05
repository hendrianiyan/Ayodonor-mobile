import 'package:flutter/material.dart';

class FeedsPage extends StatefulWidget {
  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sahabat PMI', textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/White.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white, // Set background color to white
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Mengatur posisi ke kanan
                    children: [
                      Text('Bagikan Ceritamu', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          // Aksi yang dilakukan ketika ikon di klik
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('membagikan cerita')),
                          );
                        },
                        child: Icon(Icons.camera_alt),
                      ),
                    ],
                  ),
                ),
                _buildPost(
                  profileImage: 'assets/1profil.jpeg',
                  name: 'Hendrian Gunarwan',
                  date: '22 Apr 24 || 09.20',
                  postImage: 'assets/2Pdonor.jpg',
                  description: 'Ayo Donor Darah',
                  likes: likes,
                  comments: 0,
                ),
                _buildPost(
                  profileImage: 'assets/1profil.jpeg',
                  name: 'Hendrian Gunarwan',
                  date: '22 Feb 24 || 10.30',
                  postImage: 'assets/2Pdonor.jpg',
                  description: 'Ayo Donor Darah',
                  likes: 21,
                  comments: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPost({
    required String profileImage,
    required String name,
    required String date,
    required String postImage,
    required String description,
    required int likes,
    required int comments,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Set background color to white
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(profileImage),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(date, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                postImage,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 3),
            Text(description),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {
                    setState(() {
                      this.likes++;
                    });
                  },
                ),
                Text('$likes likes'),
                SizedBox(width: 10),
                Icon(Icons.comment),
                Text('$comments comments'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
