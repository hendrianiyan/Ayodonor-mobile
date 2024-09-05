import 'package:flutter/material.dart';

class Donor2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendaftaran Donor Darah'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Silahkan mengisi Kuesioner Donor dengan memilih salah satu jawaban berikut ini',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Pilih Lokasi Donor',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari & Pilih PMI Kota/Kab.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              for (int i = 1; i <= 10; i++) buildQuestion(i),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuestion(int questionNumber) {
    String questionText = '';
    switch (questionNumber) {
      case 1:
        questionText = 'Merasa sehat, tidak sedang flu/ batuk/ demam/ pusing?';
        break;
      case 2:
        questionText = 'Apakah Anda semalam tidur minimal 4 jam?';
        break;
      case 3:
        questionText = 'Apakah Anda sedang minum obat?';
        break;
      case 4:
        questionText = 'Apakah Anda minum jamu?';
        break;
      case 5:
        questionText = 'Apakah Anda mencabut gigi dalam 1 minggu terakhir?';
        break;
      case 6:
        questionText =
            'Apakah Anda menerima vaksinasi dalam 1 minggu terakhir?';
        break;
      case 7:
        questionText =
            'Apakah Anda baru menjalani operasi dalam 3 bulan terakhir?';
        break;
      case 8:
        questionText = 'Apakah Anda pernah donor darah dalam 3 bulan terakhir?';
        break;
      case 9:
        questionText = 'Apakah Anda merasa kelelahan atau lemas saat ini?';
        break;
      case 10:
        questionText =
            'Apakah Anda baru saja bepergian ke luar negeri dalam 1 bulan terakhir?';
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          '$questionNumber. $questionText',
          style: TextStyle(fontSize: 16),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Handle Yes action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'YA',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Handle No action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  'TIDAK',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
