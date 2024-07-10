import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/Drawer/Ringkasan_transaksi.dart';
import 'package:flutter_app/Screens/home.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
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
    return Drawer(
      child: Container(
        color: Colors.blue[800],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
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
                    userName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'LIHAT PROFILE',
                    style:
                        TextStyle(color: Colors.lightBlueAccent, fontSize: 14),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text('Home', style: TextStyle(color: Colors.white)),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BcaHome()));
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
              title: Text('Pengaturan', style: TextStyle(color: Colors.white)),
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
                  MaterialPageRoute(builder: (context) => BcaHome()),
                );
              },
            ),
            Divider(color: Colors.white54),
          ],
        ),
      ),
    );
  }
}
