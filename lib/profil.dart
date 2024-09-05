import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatelessWidget {
  Future<Map<String, String?>> _getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      String? username = userDoc['username'];
      String? nik = userDoc['nik'];
      String? noHp = userDoc['noHp'];

      return {
        'username': username,
        'nik': nik,
        'noHp': noHp,
      };
    }
    return {
      'username': null,
      'nik': null,
      'noHp': null,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: AppBar(
          backgroundColor: Colors.red,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Mengatur posisi ke tengah
                children: [
                  Column(
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'Profilmu',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage('assets/1profil.jpeg'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          centerTitle: true,
        ),
      ),
      body: FutureBuilder<Map<String, String?>>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading profile data'));
          } else {
            final userData = snapshot.data;
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/White.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.only(top: 30.0),
                        children: [
                          _buildProfileInfoRow(
                              'Name', userData?['username'] ?? 'N/A'),
                          _buildProfileInfoRow(
                              'NIK', userData?['nik'] ?? 'N/A'),
                          _buildProfileInfoRow('Tempat Lahir', 'Surakarta'),
                          _buildProfileInfoRow('Tanggal Lahir', '14/12/2001'),
                          _buildProfileInfoRow('Alamat',
                              'Jl. Jendral Sudirman, Kec. Pasar Kliwon, Surakarta, Indonesia'),
                          _buildProfileInfoRow(
                              'No HP', userData?['noHp'] ?? 'N/A'),
                          SizedBox(height: 10),
                          Text(
                            '*Jika ingin melakukan perubahan data diri, hubungi admin PMI setempat',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Tambahkan aksi untuk tombol update profil
                        },
                        child: Text(
                          'UPDATE PROFIL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildProfileInfoRow(String label, String value) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
