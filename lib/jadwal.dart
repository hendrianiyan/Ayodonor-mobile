import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JadwalPage extends StatefulWidget {
  @override
  _JadwalPageState createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  DateTime? selectedDate;
  String? selectedProvince;
  String? selectedCity;
  final Map<String, List<String>> provinceCityMap = {
    'Jawa Tengah': ['Surakarta'],
    'Jawa Timur': ['Surabaya'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Donor Darah'),
        backgroundColor: Color(0xFFDC2026),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/redabstract.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'JADWAL DONOR UDD PMI',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDC2026),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Pilih Tanggal',
                    border: OutlineInputBorder(),
                    suffixIcon:
                        Icon(Icons.calendar_today, color: Color(0xFFDC2026)),
                  ),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (date != null) {
                      setState(() {
                        selectedDate = date;
                      });
                    }
                  },
                  controller: TextEditingController(
                    text: selectedDate != null
                        ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                        : '',
                  ),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Pilih Provinsi',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedProvince,
                  items: provinceCityMap.keys.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedProvince = newValue;
                      selectedCity = null;
                    });
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Pilih Kota',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedCity,
                  items: selectedProvince != null
                      ? provinceCityMap[selectedProvince!]!.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()
                      : [],
                  onChanged: (newValue) {
                    setState(() {
                      selectedCity = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (selectedDate == null ||
                        selectedProvince == null ||
                        selectedCity == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Harus isi semua pilihan'),
                        ),
                      );
                    } else {
                      if (selectedProvince == 'Jawa Tengah' &&
                          selectedCity == 'Surakarta') {
                        Navigator.pushNamed(context, '/jadwal1');
                      } else if (selectedProvince == 'Jawa Timur' &&
                          selectedCity == 'Surabaya') {
                        Navigator.pushNamed(context, '/jadwal2');
                      }
                    }
                  },
                  child: Text(
                    'CARI',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDC2026),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'dev by HG',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
