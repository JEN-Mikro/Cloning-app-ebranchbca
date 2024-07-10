import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:flutter_app/Info_status/Berhasil.dart';
import 'package:flutter_app/NoRef_Generator.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/Tarik_tunai/TarikTunai.dart';

class TarikTunaiHal2 extends StatelessWidget {
  final String nomorRekening;
  final String jumlahTarikan;

  const TarikTunaiHal2({
    Key? key,
    required this.nomorRekening,
    required this.jumlahTarikan,
  }) : super(key: key);

  String generateReferenceNumber() {
    String transactionType = 'tarik_tunai';
    return ReferenceGenerator.generateReference(transactionType);
  }

  Future<void> simpanTransaksiKeFirestore(String nomorReferensi) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance.collection('riwayatTransaksi').add({
        'uid': user?.uid,
        'nomorRekening': nomorRekening,
        'jenisTransaksi': 'Tarik Tunai',
        'jumlahTarikan': jumlahTarikan,
        'status': 'Berhasil',
        'nomorReferensi': nomorReferensi,
        'waktuTransaksi': DateTime.now(),
      });
    } catch (e) {
      print('Error saat menyimpan transaksi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Generate Nomor Referensi
    String nomorReferensi = generateReferenceNumber();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[900],
        title: Row(
          children: [
            Text(
              'Tarikan Tunai',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.other_houses_outlined, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BcaHome()));
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.check,
                                color: Colors.blue[900], size: 20),
                          ),
                        ),
                        Container(
                          width: 35,
                          height: 3,
                          color: Colors.blue[900],
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Pastikan semua data yang dimasukkan sudah benar.",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(10),
                    constraints: BoxConstraints(minWidth: double.infinity),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.arrow_drop_down,
                                  color: Colors.blue[900]),
                              SizedBox(width: 10),
                              Text(
                                'Transaksi Tarikan Tunai',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TarikTunai()));
                          },
                          child: Text(
                            'UBAH',
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            minWidth: double.infinity, minHeight: 20),
                        color: Colors.grey[200],
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nomor Rekening',
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 16),
                            ),
                            Text(
                              '$nomorRekening',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                            minWidth: double.infinity, minHeight: 20),
                        color: Colors.grey[300], // Warna latar belakang abu tua
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jumlah Tarikan',
                              style: TextStyle(
                                  color: Colors.grey[800], fontSize: 16),
                            ),
                            Text(
                              '$jumlahTarikan IDR',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        await simpanTransaksiKeFirestore(nomorReferensi);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Berhasil(
                              customText: 'Transaksi tarik tunai berhasil!',
                              nomorReferensi: nomorReferensi,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue[900],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10),
                        child: Text(
                          'Proses',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
