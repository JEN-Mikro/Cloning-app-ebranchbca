import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/Transfer_ke_bank_lain/form_bank(4).dart';

class IsiDataPenerima extends StatefulWidget {
  final int totalPembayaran;
  final String saranaPembayaran;
  final int nomorRekeningPengirim;

  const IsiDataPenerima(
      {super.key,
      required this.totalPembayaran,
      required this.nomorRekeningPengirim,
      required this.saranaPembayaran});

  @override
  State<IsiDataPenerima> createState() => _IsiDataPenerimaState();
}

class _IsiDataPenerimaState extends State<IsiDataPenerima> {
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
                    child: Text(
                  '2',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 10),
                )),
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
                  '3',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 10),
                )),
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
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              text:
                  TextSpan(style: TextStyle(fontSize: 18), children: <TextSpan>[
                TextSpan(
                    text: 'Kamu dapat mengisi ', style: TextStyle(height: 2)),
                TextSpan(
                  text: 'maksimal 5 data\n',
                  style: TextStyle(height: 2, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: 'penerima',
                    style: TextStyle(fontWeight: FontWeight.bold, height: 2))
              ]),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Icon(Icons.done, color: Colors.white)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            " Penerima 1",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              int nomorRekeningPengirim =
                                  widget.nomorRekeningPengirim;
                              String saranaPembayaran = widget.saranaPembayaran;
                              int totalPembayaran = widget.totalPembayaran;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Bank(
                                            totalPembayaran: totalPembayaran,
                                            nomorRekeningPengirim:
                                                nomorRekeningPengirim,
                                            saranaPembayaran: saranaPembayaran,
                                          )));
                            },
                            child: Text('Isi Form',
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(55, 35)),
                          ),
                          SizedBox(width: 15),
                        ],
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
}
