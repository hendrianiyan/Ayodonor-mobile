import 'package:flutter/material.dart';

class BeritaPage extends StatelessWidget {
  final List<Map<String, String>> beritaList = [
    {
      'image': 'assets/berita.jpg',
      'title':
          'TUNJUKAN SOLIDARITAS, PT. DANLIRIS BERIKAN DONASI UNTUK PALESTINA MELALUI PMI SOLO',
      'date': '27 Mar 24',
      'location': 'UDD PMI Kota Surakarta',
    },
    {
      'image': 'assets/berita1.png',
      'title':
          'PMI SOLO SALURKAN BANTUAN PERALATAN AMBULANCE UNTUK 18 AMBULANCE SE-SOLORAYA',
      'date': '04 Mar 24',
      'location': 'UDD PMI Kota Surakarta',
    },
    {
      'image': 'assets/berita2.png',
      'title': 'DEMAK MASIH TERGENANG, PMI SOLO KIRIM TIM MEDIS DAN LOGISTIK',
      'date': '15 Feb 24',
      'location': 'UDD PMI Kota Surakarta',
    },
    {
      'image': 'assets/berita3.png',
      'title': 'RATUSAN ODGJ IKUT PEMILU, GRIYA PMI SOLO JADI TPS',
      'date': '14 Feb 24',
      'location': 'UDD PMI Kota Surakarta',
    },
    {
      'image': 'assets/relawan.png',
      'title': 'SERUNYA DONOR DARAH DI TAHUN NAGA KAYU',
      'date': '12 Feb 24',
      'location': 'UDD PMI Kota Surakarta',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF44236),
        title: Text(
          'Totality for Humanity',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: beritaList.length,
        itemBuilder: (context, index) {
          final berita = beritaList[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    berita['image']!,
                    fit: BoxFit.cover,
                    width: 100, // Atur lebar gambar
                    height: 100, // Atur tinggi gambar
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          berita['title']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          berita['date']!,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          berita['location']!,
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
