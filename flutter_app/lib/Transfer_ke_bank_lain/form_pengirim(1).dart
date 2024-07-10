import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/Transfer_ke_bank_lain/contact_person(2).dart';

class FormPengirim extends StatefulWidget {
  FormPengirim({
    Key? key,
  }) : super(key: key);

  @override
  State<FormPengirim> createState() => _FormPengirimState();
}

class _FormPengirimState extends State<FormPengirim> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _nomor = TextEditingController();
  final TextEditingController _sarana = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final TextEditingController _tipe = TextEditingController();
  final TextEditingController _status = TextEditingController();
  int _nominal = 0;

  List<bool> isSelected = [true, false];

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
                padding: EdgeInsets.only(left: 15),
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(text: 'Lengkapi '),
                        TextSpan(
                          text: 'data pengirim ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: 'di bawah ini.')
                      ]),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
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
                                        return 'Nama Pengirim belum diisi';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Nama Pengirim',
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
                                    controller: _nomor,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Nomor Rekening Pengirim belum diisi';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Nomor Rekening Pengirim',
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
                                    controller: _sarana,
                                    readOnly: true,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Pilih Sarana Pembayaran'),
                                                IconButton(
                                                  icon: Icon(Icons.close,
                                                      color: Colors.blue[900]),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _sarana.text = 'Tabungan';
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 10,
                                                          backgroundColor: _sarana
                                                                      .text ==
                                                                  'Tabungan'
                                                              ? Colors.blue
                                                              : Colors
                                                                  .transparent,
                                                          child: _sarana.text ==
                                                                  'Tabungan'
                                                              ? Icon(
                                                                  Icons.check,
                                                                  size: 12,
                                                                  color: Colors
                                                                      .white)
                                                              : null,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text('Tabungan'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _sarana.text = 'Tunai';
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 10,
                                                          backgroundColor: _sarana
                                                                      .text ==
                                                                  'Tunai'
                                                              ? Colors.blue
                                                              : Colors
                                                                  .transparent,
                                                          child: _sarana.text ==
                                                                  'Tunai'
                                                              ? Icon(
                                                                  Icons.check,
                                                                  size: 12,
                                                                  color: Colors
                                                                      .white)
                                                              : null,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text('Tunai'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _sarana.text = 'Cek BCA';
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 10,
                                                          backgroundColor: _sarana
                                                                      .text ==
                                                                  'Cek BCA'
                                                              ? Colors.blue
                                                              : Colors
                                                                  .transparent,
                                                          child: _sarana.text ==
                                                                  'Cek BCA'
                                                              ? Icon(
                                                                  Icons.check,
                                                                  size: 12,
                                                                  color: Colors
                                                                      .white)
                                                              : null,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text('Cek BCA'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Sarana Pembayaran belum diisi';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Sarana Pembayaran',
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
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: TextFormField(
                                    controller: _alamat,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Alamat Lengkap belum diisi';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Alamat Lengkap',
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
                                    controller: _tipe,
                                    readOnly: true,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Pilih Tipe Nasabah'),
                                                IconButton(
                                                  icon: Icon(Icons.close,
                                                      color: Colors.blue[900]),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _tipe.text = 'Perorangan';
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 10,
                                                          backgroundColor: _tipe
                                                                      .text ==
                                                                  'Perorangan'
                                                              ? Colors.blue
                                                              : Colors
                                                                  .transparent,
                                                          child: _tipe.text ==
                                                                  'Perorangan'
                                                              ? Icon(
                                                                  Icons.check,
                                                                  size: 12,
                                                                  color: Colors
                                                                      .white)
                                                              : null,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text('Perorangan'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _tipe.text = 'Perusahaan';
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 10,
                                                          backgroundColor: _tipe
                                                                      .text ==
                                                                  'Perusahaan'
                                                              ? Colors.blue
                                                              : Colors
                                                                  .transparent,
                                                          child: _tipe.text ==
                                                                  'Perusahaan'
                                                              ? Icon(
                                                                  Icons.check,
                                                                  size: 12,
                                                                  color: Colors
                                                                      .white)
                                                              : null,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text('Perusahaan'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _tipe.text = 'Pemerintah';
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 10,
                                                          backgroundColor: _tipe
                                                                      .text ==
                                                                  'Pemerintah'
                                                              ? Colors.blue
                                                              : Colors
                                                                  .transparent,
                                                          child: _tipe.text ==
                                                                  'Pemerintah'
                                                              ? Icon(
                                                                  Icons.check,
                                                                  size: 12,
                                                                  color: Colors
                                                                      .white)
                                                              : null,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text('Pemerintah'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Tipe Nasabah',
                                      labelStyle: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(12, 5, 12, 5),
                                      floatingLabelStyle:
                                          TextStyle(color: Colors.blue[900]),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Tipe Nasabah belum diisi';
                                      }
                                      return null;
                                    },
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
                                    controller: _status,
                                    readOnly: true,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Pilih Status Penduduk'),
                                                IconButton(
                                                  icon: Icon(Icons.close,
                                                      color: Colors.blue[900]),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _status.text = 'Penduduk';
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 10,
                                                          backgroundColor: _status
                                                                      .text ==
                                                                  'Penduduk'
                                                              ? Colors.blue
                                                              : Colors
                                                                  .transparent,
                                                          child: _status.text ==
                                                                  'Penduduk'
                                                              ? Icon(
                                                                  Icons.check,
                                                                  size: 12,
                                                                  color: Colors
                                                                      .white)
                                                              : null,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text('Penduduk'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _status.text =
                                                          'Non Penduduk';
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 10,
                                                          backgroundColor: _status
                                                                      .text ==
                                                                  'Non Penduduk'
                                                              ? Colors.blue
                                                              : Colors
                                                                  .transparent,
                                                          child: _status.text ==
                                                                  'Non Penduduk'
                                                              ? Icon(
                                                                  Icons.check,
                                                                  size: 12,
                                                                  color: Colors
                                                                      .white)
                                                              : null,
                                                        ),
                                                        SizedBox(width: 10),
                                                        Text('Non Penduduk'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Status Penduduk',
                                        labelStyle: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.fromLTRB(
                                          12,
                                          5,
                                          12,
                                          5,
                                        ),
                                        floatingLabelStyle:
                                            TextStyle(color: Colors.blue[900])),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Status Penduduk belum diisi';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Text("Status Kewarganegaraan",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Spacer(),
                                    ToggleButtons(
                                      borderColor: Colors.grey[200],
                                      fillColor: Colors.blue[900],
                                      borderWidth: 2,
                                      selectedBorderColor: Colors.blue[900],
                                      selectedColor: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(3),
                                          height: 36,
                                          child: Center(
                                            child: Text(
                                              'WNI',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(3),
                                          height: 36,
                                          child: Center(
                                            child: Text(
                                              'WNA',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ],
                                      onPressed: (int index) {
                                        setState(() {
                                          for (int buttonIndex = 0;
                                              buttonIndex < isSelected.length;
                                              buttonIndex++) {
                                            isSelected[buttonIndex] =
                                                buttonIndex == index;
                                          }
                                        });
                                      },
                                      isSelected: isSelected,
                                      constraints: BoxConstraints.tightFor(
                                          height: 30, width: 50),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Container(
                                    width: double.infinity,
                                    alignment: Alignment.centerLeft,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          int nomorRekeningPengirim =
                                              int.parse(_nomor.text);
                                          String saranaPembayaran =
                                              _sarana.text;
                                          int totalPembayaran = _nominal + 2900;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => TKBL1(
                                                    totalPembayaran:
                                                        totalPembayaran,
                                                    nomorRekeningPengirim:
                                                        nomorRekeningPengirim,
                                                    saranaPembayaran:
                                                        saranaPembayaran),
                                              ));
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
                                SizedBox(height: 10)
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
