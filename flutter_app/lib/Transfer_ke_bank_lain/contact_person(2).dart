import 'package:flutter_app/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Transfer_ke_bank_lain/isi_data_penerima(3).dart';

class TKBL1 extends StatefulWidget {
  final int totalPembayaran;
  final String saranaPembayaran;
  final int nomorRekeningPengirim;

  const TKBL1(
      {super.key,
      required this.totalPembayaran,
      required this.nomorRekeningPengirim,
      required this.saranaPembayaran});

  @override
  State<TKBL1> createState() => _TKBL1State();
}

class _TKBL1State extends State<TKBL1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _noHp = TextEditingController();
  final TextEditingController _noTlp = TextEditingController();

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BcaHome()));
              },
            ),
            SizedBox(width: 10),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Column(
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
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 0),
                  Container(
                    width: 35,
                    height: 3,
                    color: Color.fromARGB(255, 221, 219, 219),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 221, 219, 219),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 0),
                  Container(
                    width: 35,
                    height: 3,
                    color: Color.fromARGB(255, 221, 219, 219),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 221, 219, 219),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 0),
                  Container(
                    width: 35,
                    height: 3,
                    color: Color.fromARGB(255, 221, 219, 219),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 221, 219, 219),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 17),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(text: 'Lengkapi '),
                        TextSpan(
                          text: 'data contact person ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: 'di\n'),
                        TextSpan(
                          text: "bawah ini",
                          style: TextStyle(
                            height: 2,
                          ),
                        ),
                        TextSpan(children: [
                          WidgetSpan(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.info_outline,
                              color: Colors.blue[900],
                              size: 20,
                            ),
                          ))
                        ])
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
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    controller: _nama,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Nama yang Dapat Dihubungi belum diisi';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Nama yang Dapat Dihubungi',
                                      labelStyle: TextStyle(color: Colors.grey),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(12, 5, 12, 5),
                                      floatingLabelStyle:
                                          TextStyle(color: Colors.blue[900]),
                                      border: InputBorder.none,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    controller: _noHp,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'No. Handphone yang Dapat Dihubungi belum diisi';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText:
                                          'No. Handphone yang Dapat Dihubungi',
                                      labelStyle: TextStyle(color: Colors.grey),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(12, 5, 12, 5),
                                      floatingLabelStyle:
                                          TextStyle(color: Colors.blue[900]),
                                      border: InputBorder.none,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    controller: _noTlp,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'No. Telepon yang Dapat Dihubungi belum diisi';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText:
                                          'No. Telepon yang Dapat Dihubungi',
                                      labelStyle: TextStyle(color: Colors.grey),
                                      contentPadding:
                                          EdgeInsets.fromLTRB(12, 5, 12, 5),
                                      floatingLabelStyle:
                                          TextStyle(color: Colors.blue[900]),
                                      border: InputBorder.none,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Container(
                                    width: double.infinity,
                                    alignment: Alignment.centerLeft,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          int nomorRekeningPengirim =
                                              widget.nomorRekeningPengirim;
                                          String saranaPembayaran =
                                              widget.saranaPembayaran;
                                          int totalPembayaran =
                                              widget.totalPembayaran;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      IsiDataPenerima(
                                                          totalPembayaran:
                                                              totalPembayaran,
                                                          nomorRekeningPengirim:
                                                              nomorRekeningPengirim,
                                                          saranaPembayaran:
                                                              saranaPembayaran))));
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                          150,
                                          50,
                                        ),
                                        backgroundColor: Colors.blue[900],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                        child: Text(
                                          "Selanjutnya",
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
        ));
  }
}
