import 'package:flutter/material.dart';
import 'stok1.dart';
import 'stok2.dart';

class StokPage extends StatefulWidget {
  @override
  _StokPageState createState() => _StokPageState();
}

class _StokPageState extends State<StokPage> {
  String? selectedProvince;
  String? selectedProduct;
  String? selectedBloodType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stok Darah UDD PMI'),
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
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'STOK DARAH UDD PMI',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Pilih Provinsi',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedProvince,
                  items:
                      <String>['Jawa Tengah', 'Jawa Timur'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedProvince = newValue;
                    });
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Pilih Produk',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedProduct,
                  items: <String>['Konvalensi', 'Aferesis'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedProduct = newValue;
                    });
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Pilih Golongan Darah',
                    border: OutlineInputBorder(),
                  ),
                  value: selectedBloodType,
                  items: <String>['A(+)', 'B(+)'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedBloodType = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (selectedProvince == null ||
                        selectedProduct == null ||
                        selectedBloodType == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Harus isi semua pilihan'),
                        ),
                      );
                    } else {
                      if (selectedProvince == 'Jawa Tengah') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Stok1Page(),
                          ),
                        );
                      } else if (selectedProvince == 'Jawa Timur') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Stok2Page(),
                          ),
                        );
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
