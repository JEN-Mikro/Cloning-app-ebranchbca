import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/Info_status/Berhasil.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/Transfer_ke_bank_lain/data_penerima(7).dart';
import 'package:flutter_app/Transfer_ke_bank_lain/pilih_bank(5).dart';
import 'package:flutter_app/NoRef_Generator.dart';

class FormPenerima extends StatefulWidget {
  final String selectedBank;
  final int totalPembayaran;
  final String saranaPembayaran;
  final int nomorRekeningPengirim;

  const FormPenerima({
    Key? key,
    required this.selectedBank,
    required this.totalPembayaran,
    required this.saranaPembayaran,
    required this.nomorRekeningPengirim,
  }) : super(key: key);

  @override
  State<FormPenerima> createState() => _FormPenerimaState();
}

class _FormPenerimaState extends State<FormPenerima> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomor = TextEditingController();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _nominal = TextEditingController();
  final TextEditingController _berita = TextEditingController();
  final TextEditingController _alamat = TextEditingController();
  final TextEditingController _tipe = TextEditingController();
  final TextEditingController _status = TextEditingController();

  List<bool> isSelected = [true, false];
  bool isChecked = false;

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
                context,
                MaterialPageRoute(builder: (context) => BcaHome()),
              );
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                    style: TextStyle(fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(text: 'Lengkapi '),
                      TextSpan(
                        text: 'data penerima ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'di bawah ini.')
                    ]),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  int nomorRekeningPengirim = widget.nomorRekeningPengirim;
                  String saranaPembayaran = widget.saranaPembayaran;
                  int totalPembayaran = widget.totalPembayaran;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PilihBank(
                        totalPembayaran: totalPembayaran,
                        nomorRekeningPengirim: nomorRekeningPengirim,
                        saranaPembayaran: saranaPembayaran,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        int nomorRekeningPengirim =
                            widget.nomorRekeningPengirim;
                        String saranaPembayaran = widget.saranaPembayaran;
                        int totalPembayaran = widget.totalPembayaran;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PilihBank(
                              totalPembayaran: totalPembayaran,
                              nomorRekeningPengirim: nomorRekeningPengirim,
                              saranaPembayaran: saranaPembayaran,
                            ),
                          ),
                        );
                      },
                      initialValue: widget.selectedBank,
                      decoration: InputDecoration(
                        labelText: 'Bank Tujuan',
                        labelStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                        floatingLabelStyle: TextStyle(color: Colors.blue[900]),
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Nomor Rekening Penerima',
                    labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                    contentPadding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                    floatingLabelStyle: TextStyle(color: Colors.blue[900]),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor Rekening Penerima belum diisi';
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
                ),
                child: TextFormField(
                  controller: _nama,
                  decoration: InputDecoration(
                    labelText: 'Nama Penerima',
                    labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                    floatingLabelStyle: TextStyle(color: Colors.blue[900]),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Penerima belum diisi';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: _nominal,
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nominal belum Diisi';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Nominal',
                                labelStyle: TextStyle(color: Colors.grey),
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 5, 12, 5),
                                floatingLabelStyle:
                                    TextStyle(color: Colors.blue[900]),
                                border: InputBorder.none,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Positioned(
                              right: 8,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: 2,
                                    color: Colors.grey,
                                    height: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'IDR',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  controller: _berita,
                  decoration: InputDecoration(
                      labelText: 'Berita',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                      floatingLabelStyle: TextStyle(color: Colors.blue[900])),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Berita belum diisi';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  textAlign: TextAlign.left,
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
                    contentPadding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                    floatingLabelStyle: TextStyle(color: Colors.blue[900]),
                    border: InputBorder.none,
                  ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Pilih Tipe Nasabah'),
                              IconButton(
                                icon:
                                    Icon(Icons.close, color: Colors.blue[900]),
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor:
                                            _tipe.text == 'Perorangan'
                                                ? Colors.blue
                                                : Colors.transparent,
                                        child: _tipe.text == 'Perorangan'
                                            ? Icon(Icons.check,
                                                size: 12, color: Colors.white)
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor:
                                            _tipe.text == 'Perusahaan'
                                                ? Colors.blue
                                                : Colors.transparent,
                                        child: _tipe.text == 'Perusahaan'
                                            ? Icon(Icons.check,
                                                size: 12, color: Colors.white)
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor:
                                            _tipe.text == 'Pemerintah'
                                                ? Colors.blue
                                                : Colors.transparent,
                                        child: _tipe.text == 'Pemerintah'
                                            ? Icon(Icons.check,
                                                size: 12, color: Colors.white)
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
                    labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                    floatingLabelStyle: TextStyle(color: Colors.blue[900]),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Pilih Status Penduduk'),
                              IconButton(
                                icon:
                                    Icon(Icons.close, color: Colors.blue[900]),
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor:
                                            _status.text == 'Penduduk'
                                                ? Colors.blue
                                                : Colors.transparent,
                                        child: _status.text == 'Penduduk'
                                            ? Icon(Icons.check,
                                                size: 12, color: Colors.white)
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
                                    _status.text = 'Non Penduduk';
                                  });
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 10,
                                        backgroundColor:
                                            _status.text == 'Non Penduduk'
                                                ? Colors.blue
                                                : Colors.transparent,
                                        child: _status.text == 'Non Penduduk'
                                            ? Icon(Icons.check,
                                                size: 12, color: Colors.white)
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
                    labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                    floatingLabelStyle: TextStyle(color: Colors.blue[900]),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Status Penduduk belum diisi';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Status Kewarganegaraan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
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
                          isSelected[buttonIndex] = buttonIndex == index;
                        }
                      });
                    },
                    isSelected: isSelected,
                    constraints: BoxConstraints.tightFor(height: 30, width: 50),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                    activeColor: Colors.blue[900],
                  ),
                  Text('Simpan ke Daftar Transfer',
                      style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    saveTransferData();
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50),
                  backgroundColor: Colors.blue[900],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "Selanjutnya",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveTransferData() {
    FirebaseAuth auth = FirebaseAuth.instance;
    String referenceNumber =
        ReferenceGenerator.generateReference('transfer_bank');
    FirebaseFirestore.instance.collection('RiwayatTransfer').add({
      'uid': auth.currentUser!.uid,
      'nomorrekeningpenerima': _nomor.text,
      'namapenerima': _nama.text,
      'nominaltransfer': _nominal.text,
      'berita': _berita.text,
      'alamat': _alamat.text,
      'tipe': _tipe.text,
      'status': _status.text,
      'banktujuan': widget.selectedBank,
      'timestamp': Timestamp.now(),
      'nomorReferensi': referenceNumber,
    }).then((DocumentReference docRef) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DataPenerima(
            totalPembayaran: widget.totalPembayaran,
            nomorRekeningPengirim: widget.nomorRekeningPengirim,
            saranaPembayaran: widget.saranaPembayaran,
            nominal: _nominal.text,
            referenceNumber: referenceNumber,
          ),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Gagal menyimpan data: $error"),
          backgroundColor: Colors.red,
        ),
      );
    });
  }
}
