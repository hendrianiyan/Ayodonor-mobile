import 'package:ayodonor_2/donor.dart';
import 'package:ayodonor_2/spes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'sign_up.dart';
import 'event.dart';
import 'feeds.dart';
import 'FAQ.dart';
import 'channel.dart';
import 'profil.dart';
import 'jadwal.dart';
import 'jadwal1.dart';
import 'jadwal2.dart';
import 'stok.dart';
import 'stok1.dart';
import 'stok2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/main': (context) => MainPage(),
        '/jadwal': (context) => JadwalPage(),
        '/jadwal1': (context) => Jadwal1Page(),
        '/jadwal2': (context) => Jadwal2Page(),
        '/stok': (context) => StokPage(),
        '/stok1': (context) => Stok1Page(),
        '/stok2': (context) => Stok2Page(),
        '/spes': (context) => SpesPage()
      },
      home: FutureBuilder<bool>(
        future: _checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Loading indicator while checking login status
          } else {
            if (snapshot.data == true) {
              return MainPage(); // Navigate to MainPage if already logged in
            } else {
              return LoginPage(); // Navigate to LoginPage if not logged in
            }
          }
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  int _currentIndex = 2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      // Aplikasi masuk ke background atau ditutup
      await _logout(); // Panggil fungsi logout
    }
  }

  Future<void> _logout() async {
    try {
      // Proses logout dari FirebaseAuth
      await FirebaseAuth.instance.signOut();

      // Hapus status login dan username dari SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('username'); // Hapus username
    } catch (e) {
      print('Logout failed: $e'); // Debug print
    }
  }

  Future<bool> _isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  final List<Widget> _pages = [
    FeedsPage(),
    FAQPage(),
    HomePage(),
    ChannelPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isUserLoggedIn(),
      builder: (context, snapshot) {
        bool isLoggedIn = snapshot.data ?? false;

        return Scaffold(
          body: _pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              if (!isLoggedIn && index == 4) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Lakukan Login untuk Mengakses ini. Mengarahkan ke halaman login...'),
                    duration: Duration(seconds: 3),
                  ),
                );

                // Redirect to login page after 3 seconds
                Future.delayed(Duration(seconds: 3), () {
                  Navigator.pushReplacementNamed(context, '/login');
                });
              } else {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outlined),
                label: 'Feeds',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.question_mark),
                label: 'FAQ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_rounded),
                label: 'Channel',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box_rounded),
                label: 'Profil',
              ),
            ],
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.blueGrey,
            selectedLabelStyle: TextStyle(color: Colors.black),
            unselectedLabelStyle: TextStyle(color: Colors.black),
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  Future<String> _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? 'Selamat Datang Tamu';
  }

  Future<bool> _isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  void _onMenuItemSelected(BuildContext context, String value) {
    switch (value) {
      case 'kartuDonor':
        // Navigate to Kartu Donor page
        break;
      case 'rekamMedis':
        // Navigate to Rekam Medis page
        break;
      case 'kotakPesan':
        // Navigate to Kotak Pesan page
        break;
      case 'logout':
        _logout(context);
        break;
    }
  }

  Future<void> _logout(BuildContext context) async {
    try {
      // Proses logout dari FirebaseAuth
      await FirebaseAuth.instance.signOut();

      // Hapus status login dan username dari SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('username'); // Hapus username

      // Arahkan ke halaman login setelah logout berhasil
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      print('Logout failed: $e'); // Debug print
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logout failed, please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDC2026), // Warna merah untuk AppBar
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            FutureBuilder<bool>(
              future: _isUserLoggedIn(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.data == true) {
                  return CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/1profil.jpeg'),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
            SizedBox(width: 10),
            Spacer(),
            FutureBuilder<String>(
              future: _getUsername(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data ?? 'Selamat Datang Tamu',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    if (snapshot.data == 'Selamat Datang Tamu') ...[
                      Text(
                        'Silahkan login',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                    if (snapshot.data != 'Selamat Datang Tamu') ...[
                      Text(
                        'Donor 10 kali',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ],
                );
              },
            ),
            Spacer(),
            FutureBuilder<bool>(
              future: _isUserLoggedIn(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.data == true) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFF44236),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Gol. A+',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  void _onMenuItemSelected(BuildContext context, String value) {
    switch (value) {
      case 'kartuDonor':
        // Navigate to Kartu Donor page
        break;
      case 'rekamMedis':
        // Navigate to Rekam Medis page
        break;
      case 'kotakPesan':
        // Navigate to Kotak Pesan page
        break;
      case 'logout':
        _logout(context);
        break;
    }
  }

  Future<void> _logout(BuildContext context) async {
    try {
      // Proses logout dari FirebaseAuth
      await FirebaseAuth.instance.signOut();

      // Hapus status login dan username dari SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('username'); // Hapus username

      // Arahkan ke halaman login setelah logout berhasil
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      print('Logout failed: $e'); // Debug print
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Logout failed, please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/2stokdarah.png',
      'assets/2registrasi.png', // Tambahkan path untuk registrasi
      'assets/2jadwalmu.png', // Tambahkan path untuk jadwal
      'assets/2pengajuanmu.png',
      'assets/3Event.png',
      'assets/4SPES.png'
    ];

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/White.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 2.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PopupMenuButton<String>(
                        icon: Icon(Icons.menu),
                        onSelected: (value) =>
                            _onMenuItemSelected(context, value),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'kartuDonor',
                            child: Row(
                              children: [
                                Icon(Icons.qr_code, color: Colors.red),
                                SizedBox(width: 10),
                                Text('Kartu Donor'),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'rekamMedis',
                            child: Row(
                              children: [
                                Icon(Icons.medical_services, color: Colors.red),
                                SizedBox(width: 10),
                                Text('Rekam Medis'),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'kotakPesan',
                            child: Row(
                              children: [
                                Icon(Icons.email, color: Colors.red),
                                SizedBox(width: 10),
                                Text('Kotak Pesan'),
                              ],
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'logout',
                            child: Row(
                              children: [
                                Icon(Icons.logout, color: Colors.red),
                                SizedBox(width: 10),
                                Text('Logout'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Center(
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: Text(
                              'Kegiatan Donor',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: FutureBuilder<bool>(
                future: _checkLoginStatus(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    // Jika belum selesai loading
                    return Center(child: CircularProgressIndicator());
                  }

                  bool isLoggedIn = snapshot.data ?? false;

                  return ListView.builder(
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 5),
                        height: 120,
                        child: GestureDetector(
                          onTap: () {
                            if (imagePaths[index] == 'assets/4SPES.png') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SpesPage(), // Navigasi ke spes.dart
                                ),
                              );
                            } else if (imagePaths[index] ==
                                'assets/2stokdarah.png') {
                              if (!isLoggedIn) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Lakukan Login untuk Mengakses ini'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              } else {
                                Navigator.pushNamed(context, '/stok');
                              }
                            } else if (imagePaths[index] ==
                                'assets/2registrasi.png') {
                              if (!isLoggedIn) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Lakukan Login untuk Mengakses ini'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DonorPage(), // Navigasi ke donor.dart
                                  ),
                                );
                              }
                            } else if (imagePaths[index] ==
                                'assets/2jadwalmu.png') {
                              if (!isLoggedIn) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Lakukan Login untuk Mengakses ini'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              } else {
                                Navigator.pushNamed(context, '/jadwal');
                              }
                            } else if (imagePaths[index] ==
                                'assets/3Event.png') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EventPage(),
                                ),
                              );
                            }
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                imagePaths[index],
                                width: MediaQuery.of(context).size.width,
                                height: 150,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
