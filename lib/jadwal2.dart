import 'package:flutter/material.dart';

class Jadwal2Page extends StatelessWidget {
  final List<Map<String, String>> schedules = [
    {
      'location': 'MTA MATESIH Surabaya',
      'time': '07:00:00',
      'donors': '200 Orang',
      'update': '03 Jul 2024 | 15:08'
    },
    {
      'location': 'BANK INDONESIA, SURABAYA',
      'time': '06:00:00',
      'address': 'JL. Bandulan Surabaya',
      'donors': '100 Orang',
      'update': '03 Jul 2024 | 15:08'
    },
    {
      'location': 'BMPD Sby (Nano Syariah & Panin Dubai Syariah)',
      'time': '07:00:00',
      'address': 'Jl. RM Said No. 142 Surabaya',
      'donors': '30 Orang',
      'update': '03 Jul 2024 | 15:08'
    },
    {
      'location': 'BMPD Surabaya (BCA Surabaya, Abdul Ghani)',
      'time': '09:00:00',
      'address': 'Jl. Abdul Ghani No. 3 Surabaya',
      'donors': '70 Orang',
      'update': '03 Jul 2024 | 15:08'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Donor - Surabaya'),
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
                    Image.asset(
                      'assets/GoMaps.png',
                      width: 50,
                      height: 50,
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
                          Text('Jam Mulai : ${schedules[index]['time']}'),
                          Text('Rencana Donor : ${schedules[index]['donors']}'),
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
