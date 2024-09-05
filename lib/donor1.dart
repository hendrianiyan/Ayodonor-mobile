import 'package:ayodonor_2/donor2.dart';
import 'package:flutter/material.dart';

class Donor1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Warna background putih
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Center(
              child: Image.asset(
                'assets/donor.png', // Logo di atas
                height: 100, // Ukuran logo diperkecil
              ),
            ),
            SizedBox(height: 150),
            Image.asset(
              'assets/sofa.jpeg', // Gambar sofa di tengah
              height: 150,
            ),
            SizedBox(height: 24),
            Text(
              'Silahkan menunggu antrian donor, terima kasih. Donor Darah Anda selamatkan sesama',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.center, // Mengatur teks menjadi rata tengah
            ),
            Spacer(), // Spacer untuk mendorong tombol ke bawah
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Donor2Page(), // Navigasi ke donor2.dart
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize:
                    Size(double.infinity, 50), // Lebar tombol selebar layar
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.orange,
                ),
              ),
            ),
            SizedBox(height: 16), // Jarak antara tombol dan bawah layar
          ],
        ),
      ),
    );
  }
}
