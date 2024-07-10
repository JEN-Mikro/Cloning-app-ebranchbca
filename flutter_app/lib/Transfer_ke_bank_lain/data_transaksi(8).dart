import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/Transfer_ke_bank_lain/check_data(9).dart';

class TKBL3 extends StatefulWidget {
  final int totalPembayaran;
  final String saranaPembayaran;
  final int nomorRekeningPengirim;
  final String referenceNumber;

  const TKBL3(
      {super.key,
      required this.totalPembayaran,
      required this.nomorRekeningPengirim,
      required this.saranaPembayaran,
      required this.referenceNumber});

  @override
  State<TKBL3> createState() => _TKBL3State();
}

class _TKBL3State extends State<TKBL3> {
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
                  ),
                ),
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
                  ),
                ),
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
                    '3',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 0),
              Container(
                width: 35,
                height: 3,
                color: Colors.grey[200],
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '4',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 17),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 18),
                children: <TextSpan>[
                  TextSpan(text: 'Pastikan ', style: TextStyle(height: 2)),
                  TextSpan(
                    text: 'data transaksi ',
                    style: TextStyle(
                      height: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'dibawah ini\n',
                    style: TextStyle(height: 2),
                  ),
                  TextSpan(text: 'benar', style: TextStyle(height: 1.5)),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 15),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Total Pembayaran',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    widget.totalPembayaran.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'IDR',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    'Sarana Pembayaran',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    widget.saranaPembayaran,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    'Nomor Rekening Pengirim',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    widget.nomorRekeningPengirim.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => TKBL4(
                                      referenceNumber: widget.referenceNumber,
                                    )),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 50),
                            backgroundColor: Colors.blue[900],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "Selanjutnya",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
