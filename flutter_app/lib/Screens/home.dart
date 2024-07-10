import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/Drawer/Ringkasan_transaksi.dart';
import 'package:flutter_app/Screens/Open_EBranch.dart';
import 'package:flutter_app/Setoran_tunai/st1.dart';
import 'package:flutter_app/Tarik_tunai/TarikTunai.dart';
import 'package:flutter_app/Transfer_ke_bank_lain/form_pengirim(1).dart';

class BcaHome extends StatefulWidget {
  @override
  _BcaHomeState createState() => _BcaHomeState();
}

class _BcaHomeState extends State<BcaHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String userName = "";

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String email = user?.email ?? '';

      var userDoc =
          await FirebaseFirestore.instance.collection('users').doc(email).get();

      if (userDoc.exists) {
        setState(() {
          userName = userDoc['nama'];
        });
      }
    } catch (e) {
      print("Error fetching user name: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      _openDrawer();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.menu, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          "HOME",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20, 10.0, 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Isi Form Online",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Lakukan pengisian form untuk mempercepat waktu proses layanan di cabang",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFeatureContainer(context, "Tarik\nTunai",
                        'assets/images/tarikan.jpeg', TarikTunai()),
                    _buildFeatureContainer(context, "Setoran\nTunai",
                        'assets/images/setoran.jpeg', const ST1()),
                    _buildFeatureContainer(context, "Transfer ke\nBank Lain",
                        'assets/images/transfer.jpeg', FormPengirim()),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 25.0, 25.0, 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reservasi Online",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Permudah transaksimu dengan reservasi waktu kunjungan di cabang terdekat",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      _buildReservationContainer(context, "Reservasi Teller",
                          'assets/images/teller.jpeg'),
                      const SizedBox(height: 10),
                      _buildReservationContainer(
                          context, "Reservasi CS", 'assets/images/cs.jpeg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue[800],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue[800]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/user.jpeg'),
                    ),
                    SizedBox(height: 8),
                    Text(
                      userName, // Use the userName variable here
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'LIHAT PROFILE',
                      style: TextStyle(
                          color: Colors.lightBlueAccent, fontSize: 14),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text('Home', style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(color: Colors.white54),
              ListTile(
                leading: Icon(Icons.book, color: Colors.white),
                title: Text('Ringkasan Transaksi',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RingkasanTransaksiPage()));
                },
              ),
              Divider(color: Colors.white54),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title:
                    Text('Pengaturan', style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(color: Colors.white54),
              ListTile(
                leading: Icon(Icons.headset, color: Colors.white),
                title: Text('Hubungi Halo BCA',
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(color: Colors.white54),
              ListTile(
                leading: Icon(Icons.receipt, color: Colors.white),
                title: Text('Ketentuan', style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(color: Colors.white54),
              ListTile(
                leading: Icon(Icons.power_settings_new, color: Colors.white),
                title: Text('Keluar', style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OpenApp()),
                  );
                },
              ),
              Divider(color: Colors.white54),
            ],
          ),
        ),
      ),
    );
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  Widget _buildFeatureContainer(BuildContext context, String title,
      String imagePath, Widget destinationPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.263,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 48,
              height: 48,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildReservationContainer(
    BuildContext context, String title, String imagePath) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(
              imagePath,
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const Text(
                  "Untuk transaksi Pembukaan Rekening, Aktivasi mBCA/Klik BCA, Pengajuan Kartu Kredit, dan Transaksi CS lainnya.",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
