import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/Transfer_ke_bank_lain/data_transaksi(8).dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DataPenerima extends StatefulWidget {
  final int totalPembayaran;
  final String saranaPembayaran;
  final int nomorRekeningPengirim;
  final String nominal;
  final String referenceNumber;

  const DataPenerima({
    Key? key,
    required this.totalPembayaran,
    required this.nomorRekeningPengirim,
    required this.saranaPembayaran,
    required this.nominal,
    required this.referenceNumber,
  }) : super(key: key);

  @override
  _DataPenerimaState createState() => _DataPenerimaState();
}

class _DataPenerimaState extends State<DataPenerima> {
  late int _nominalValue;

  @override
  void initState() {
    super.initState();
    _nominalValue = int.tryParse(widget.nominal) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    int totalPembayaran = _nominalValue + 2900;

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
                    '2',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 10,
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
                    '3',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
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
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 18),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Kamu dapat mengisi ',
                    style: TextStyle(height: 2),
                  ),
                  TextSpan(
                    text: 'maksimal 5 data\n',
                    style: TextStyle(
                      height: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'penerima',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            " Penerima 1",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.blue[900],
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.blue[900],
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color.fromARGB(255, 197, 194, 194),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.person_add_alt_1,
                                        color: Colors.blue[900],
                                      ),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      'TAMBAH PENERIMA',
                                      style: TextStyle(
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 230,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Total Nominal',
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
                                          widget.nominal,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'IDR',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: TextStyle(fontSize: 18),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Total Biaya Transfer',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              TextSpan(
                                                children: [
                                                  WidgetSpan(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      child: Icon(
                                                        Icons.info_outline,
                                                        color: Colors.blue[900],
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          '2900',
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
                                          totalPembayaran.toString(),
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
                                      builder: ((context) => TKBL3(
                                            totalPembayaran: totalPembayaran,
                                            nomorRekeningPengirim:
                                                widget.nomorRekeningPengirim,
                                            saranaPembayaran:
                                                widget.saranaPembayaran,
                                            referenceNumber:
                                                widget.referenceNumber,
                                          )),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(150, 50),
                                  backgroundColor: Colors.blue[900],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
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
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
