import 'package:flutter/material.dart';
import 'package:logbook/notifikasi/notifikasiPage.dart';
import 'package:logbook/pages/Profilpage.dart';
import 'package:logbook/pages/auth_page.dart';
import 'package:logbook/pages/home_page.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import Font Awesome Icons

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logbook App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profilpage(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required String title}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  List<IconData> activityIcons = [
    FontAwesomeIcons.graduationCap, // Ganti dengan ikon yang sesuai
    FontAwesomeIcons.book, // Ganti dengan ikon yang sesuai
    FontAwesomeIcons.running, // Contoh ikon lain, ganti dengan yang sesuai
    FontAwesomeIcons.music, // Contoh ikon lain, ganti dengan yang sesuai
    FontAwesomeIcons.coffee, // Contoh ikon lain, ganti dengan yang sesuai
    FontAwesomeIcons.bicycle, // Contoh ikon lain, ganti dengan yang sesuai
    FontAwesomeIcons.camera, // Contoh ikon lain, ganti dengan yang sesuai
    FontAwesomeIcons.paintBrush, // Contoh ikon lain, ganti dengan yang sesuai
    FontAwesomeIcons.gamepad, // Contoh ikon lain, ganti dengan yang sesuai
  ];

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        bool isPortrait = orientation == Orientation.portrait;

        if (isPortrait) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Menu Utama'),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.deepPurple),
                    accountName: Text('Wayan Merta'),
                    accountEmail: Text('wayan0468@gmail.com'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/merta.jpg'),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      'Logout',
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                      // Lakukan tindakan logout di sini
                    },
                  ),
                  // Tambahkan item-menu lainnya di sini jika diperlukan.
                ],
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F7),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      cursorHeight: 20,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: "Cari",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: activityIcons.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            // Jika kegiatan 1 diklik
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          }
                        },
                        child: Card(
                          margin: EdgeInsets.all(8.0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                activityIcons[
                                    index], // Gunakan ikon yang sesuai
                                color: Colors.black,
                                size:
                                    32.0, // Sesuaikan ukuran ikon sesuai keinginan Anda
                              ),
                              SizedBox(
                                height:
                                    4.0, // Beri jarak sedikit antara ikon dan judul
                              ),
                              Text(
                                'Kegiatan ${index + 1}', // Ganti dengan judul yang sesuai
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          body: Row(
            children: [
              Container(
                width: 200.0,
                color: Colors.grey[200],
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: 8,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    bool selected = index == 0;
                    return Container(
                      margin: const EdgeInsets.only(
                        bottom: 12.0,
                      ),
                      height: 46,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selected ? Colors.deepPurple : Colors.transparent,
                          foregroundColor:
                              selected ? Colors.white : Colors.black,
                          elevation: selected ? 1.0 : 0.0,
                        ),
                        onPressed: () {
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(), // Ganti dengan halaman tujuan yang sesuai
                              ),
                            );
                          }
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.developer_board,
                              size: 24.0,
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Expanded(
                              child: Text(
                                "Kegiatan $index",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
