import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final List<String> questions = [
    "Mengapa kita perlu donor darah?",
    "Berapa lama waktu pengambilan darah?",
    "Apa itu donor darah trombosit?",
    "Kondisi seperti apa untuk kita tidak boleh donor darah?",
    "Bagaimana cara mengetahui karakteristik golongan darah?",
    "Anakah kegiatan event donor darah bisa diikuti semua kalangan?",
    "Hal yang perlu disiapkan untuk melakukan donor darah?",
    "Apa itu penyakit Thalasemia?",
    "Kenapa dipungut biaya ketika butuh darah di PMI?",
    "Bagaimana cara mengadakan kegiatan donor darah di daerahku?",
    "Bagaimana cara melakukan donasi di PMI?",
    "Benefit apa yang kita peroleh sebagai pendonor darah?"
  ];

  List<String> filteredQuestions = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredQuestions = questions;
    searchController.addListener(() {
      filterQuestions();
    });
  }

  void filterQuestions() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredQuestions = questions
          .where((question) => question.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informasimu"),
        backgroundColor: Colors.red,
        centerTitle: true,
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
          ListView.builder(
            padding: EdgeInsets.only(top: 80.0),
            itemCount: filteredQuestions.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Color(0xFFF8736A),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  title: Text(
                    filteredQuestions[index],
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(question: filteredQuestions[index]),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(8.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Cari Pertanyaanmu...",
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String question;

  DetailPage({required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pertanyaan"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          question,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
