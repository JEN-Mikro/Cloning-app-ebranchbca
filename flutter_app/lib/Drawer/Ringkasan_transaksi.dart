import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Drawer/Drawer_app.dart';

class RingkasanTransaksiPage extends StatefulWidget {
  @override
  _RingkasanTransaksiPageState createState() => _RingkasanTransaksiPageState();
}

class _RingkasanTransaksiPageState extends State<RingkasanTransaksiPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          'Ringkasan Transaksi',
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.6),
          indicatorColor: Colors.blue[400],
          indicatorWeight: 3.0,
          tabs: [
            Tab(text: 'Tarik Tunai'),
            Tab(text: 'Setoran Tunai'),
            Tab(text: 'Transfer Ke Bank Lain'),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          TarikTunaiWidget(),
          SetoranTunaiWidget(),
          TransferKeBankLain(),
        ],
      ),
    );
  }
}

class TarikTunaiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Center(child: Text('No user logged in'));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('riwayatTransaksi')
          .where('uid', isEqualTo: user.uid)
          .orderBy('waktuTransaksi', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var transaction = snapshot.data!.docs[index];
            var data = transaction.data() as Map<String, dynamic>;

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['waktuTransaksi'] != null
                        ? DateFormat('dd MMM yyyy, HH:mm')
                            .format(data['waktuTransaksi'].toDate())
                        : 'Tanggal tidak tersedia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tarik Tunai',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Nominal: ${data['jumlahTarikan']} IDR',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Nomor Rekening: ${data['nomorRekening']}',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Status: ${data['status'] ?? "Berhasil"}',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Nomor Referensi: ${data['nomorReferensi'] ?? "Not Available"}',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class SetoranTunaiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Center(child: Text('No user logged in'));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('riwayatTransaksi')
          .where('uid', isEqualTo: user.uid)
          .where('transactionType', isEqualTo: 'Setoran Tunai')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var transaction = snapshot.data!.docs[index];
            var data = transaction.data() as Map<String, dynamic>;

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('dd MMM yyyy, HH:mm')
                        .format(data['timestamp'].toDate()),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Setoran Tunai',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Nominal: ${data['amount']} IDR',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Nama Penerima: ${data['recipientName'] ?? "Not Available"}',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Nomor Rekening: ${data['accountNumber']}',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Status: ${data['status'] == null || data['status'] == "" ? "Berhasil" : data['status']}',
                    style: TextStyle(
                      color: data['status'] == null || data['status'] == ""
                          ? Colors.blue[900]
                          : (data['status'] == "success"
                              ? Colors.green[400]
                              : Colors.orange[400]),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Nomor Referensi: ${data['nomorReferensi']}',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class TransferKeBankLain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Center(child: Text('Tidak ada pengguna yang masuk'));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('RiwayatTransfer')
          .where('uid', isEqualTo: user.uid)
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var transaction = snapshot.data!.docs[index];
            var data = transaction.data() as Map<String, dynamic>;

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          DateFormat('dd MMM yyyy, HH:mm')
                              .format(data['timestamp'].toDate()),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Transfer Ke Bank Lain',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Nomor Rekening Penerima: ${data['nomorrekeningpenerima']}',
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(height: 4.0),
                  Text('Nama Penerima: ${data['namapenerima']}',
                      style: TextStyle(color: Colors.grey[700])),
                  SizedBox(height: 4.0),
                  Text('Nominal Transfer: ${data['nominaltransfer']} IDR',
                      style: TextStyle(color: Colors.black87)),
                  SizedBox(height: 4.0),
                  Text('Berita: ${data['berita']}',
                      style: TextStyle(color: Colors.black87)),
                  SizedBox(height: 4.0),
                  Text('Alamat: ${data['alamat']}',
                      style: TextStyle(color: Colors.black87)),
                  SizedBox(height: 4.0),
                  Text('Tipe Nasabah: ${data['tipe']}',
                      style: TextStyle(color: Colors.black87)),
                  SizedBox(height: 4.0),
                  Text('Status Penduduk: ${data['status']}',
                      style: TextStyle(color: Colors.black87)),
                  SizedBox(height: 4.0),
                  Text('Bank Tujuan: ${data['banktujuan']}',
                      style: TextStyle(color: Colors.black87)),
                  SizedBox(height: 4.0),
                  Text(
                    'Status: Berhasil',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Nomor Referensi: ${data['nomorReferensi'] ?? "Not Available"}',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
