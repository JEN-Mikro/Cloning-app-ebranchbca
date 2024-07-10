import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/info_status/berhasil.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TKBL4 extends StatefulWidget {
  final String referenceNumber;
  const TKBL4({Key? key, required this.referenceNumber}) : super(key: key);

  @override
  State<TKBL4> createState() => _TKBL4State();
}

class _TKBL4State extends State<TKBL4> {
  final Uuid uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Transfer ke Bank Lain',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.other_houses_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BcaHome()));
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 15),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: Icon(
                  Icons.done,
                  color: Colors.white,
                )),
              ),
              SizedBox(width: 0),
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
                    child: Icon(
                  Icons.done,
                  color: Colors.white,
                )),
              ),
              SizedBox(width: 0),
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
                    child: Icon(
                  Icons.done,
                  color: Colors.white,
                )),
              ),
              SizedBox(width: 0),
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
                    '4',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 17),
            child: RichText(
              text:
                  TextSpan(style: TextStyle(fontSize: 18), children: <TextSpan>[
                TextSpan(
                    text: 'Pastikan semua data yang dimasukan\n',
                    style: TextStyle(height: 2)),
                TextSpan(
                  text: 'sudah benar.',
                  style: TextStyle(height: 2),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 202, 199, 199),
                                      width: 2,
                                    )),
                                child: Row(
                                  children: [
                                    SizedBox(width: 7),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.blue[900],
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      "Data Pengirim",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "UBAH",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[900],
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(width: 10)
                                  ],
                                )),
                            SizedBox(height: 10),
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 202, 199, 199),
                                    width: 2,
                                  )),
                              child: Row(
                                children: [
                                  SizedBox(width: 7),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.blue[900],
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    "Data Penerima 1",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "UBAH",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[900],
                                        fontSize: 15),
                                  ),
                                  SizedBox(width: 10)
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 202, 199, 199),
                                      width: 2,
                                    )),
                                child: Row(
                                  children: [
                                    SizedBox(width: 7),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.blue[900],
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      "Data Transaksi",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(width: 10)
                                  ],
                                )),
                            SizedBox(height: 40),
                            Container(
                                width: double.infinity,
                                alignment: Alignment.centerLeft,
                                child: ElevatedButton(
                                  onPressed: () {
                                    saveReferenceNumber(widget.referenceNumber);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(150, 50),
                                    backgroundColor: Colors.blue[900],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Text(
                                      "Proses",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void saveReferenceNumber(String referenceNumber) {
    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseFirestore.instance.collection('FormPenerima').add({
      'uid': auth.currentUser!.uid,
      'nomorReferensi': referenceNumber,
      'timestamp': Timestamp.now(),
    }).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Berhasil(
            customText: "Transfer ke Bank Lain",
            nomorReferensi: referenceNumber,
          ),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gagal menyimpan nomor referensi: $error"),
          backgroundColor: Colors.red,
        ),
      );
    });
  }
}
