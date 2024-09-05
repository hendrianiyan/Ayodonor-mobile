import 'package:flutter/material.dart';

class Stok2Page extends StatelessWidget {
  final List<Map<String, String>> schedules = [
    {
      'location': 'MTA MATESIH',
      'time': '07:00:00',
      'donors': '200 Orang',
      'stock': '7',
      'update': '03 Jul 2024 | 15:08'
    },
    {
      'location': 'BANK INDONESIA, Surabaya',
      'time': '06:00:00',
      'donors': '100 Orang',
      'stock': '5',
      'update': '03 Jul 2024 | 15:08'
    },
    {
      'location': 'BMPD Ska (Nano Syariah & Panin Dubai Syariah)',
      'time': '07:00:00',
      'address': 'Jl. RM Said No. 142 Surabaya',
      'donors': '30 Orang',
      'stock': '12',
      'update': '03 Jul 2024 | 15:08'
    },
    {
      'location': 'BMPD Surakarta (BCA SUrabaya, Slamet Riyadi)',
      'time': '09:00:00',
      'address': 'Jl. Slamet Riyadi No. 3 Surabaya',
      'donors': '70 Orang',
      'stock': '5',
      'update': '03 Jul 2024 | 15:08'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stok Donor - Jawa Timur'),
        backgroundColor: Color(0xFFDC2026),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(5.0),
        itemCount: schedules.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Jumlah Stok Darah',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          schedules[index]['stock']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'UTD PMI Kota Surabaya',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            schedules[index]['location']!,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          if (schedules[index].containsKey('address'))
                            Text(schedules[index]['address']!),
                          SizedBox(height: 5),
                          Text(
                            'Update on : ${schedules[index]['update']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
