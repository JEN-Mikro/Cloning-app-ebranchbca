import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/Tarik_tunai/TarikTunai2.dart';
import 'package:intl/intl.dart';

class TarikTunai extends StatelessWidget {
  final nomorRekeningController = TextEditingController();
  final jumlahTarikanController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final jumlahTarikanFormatter =
        TextInputFormatter.withFunction((oldValue, newValue) {
      final regExp = RegExp(r'[^\d]');
      String newText = newValue.text.replaceAll(regExp, '');
      int value = int.tryParse(newText) ?? 0;
      String newTextFormatted =
          NumberFormat.decimalPattern('id_ID').format(value);
      return newValue.copyWith(
        text: newTextFormatted,
        selection: TextSelection.collapsed(offset: newTextFormatted.length),
      );
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[900],
        title: Row(
          children: [
            SizedBox(width: 10),
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
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
                              '2',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 208, 205, 205)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Lengkapi ',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          TextSpan(
                            text: 'transaksi tarikan tunai ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                          TextSpan(
                            text: 'di bawah ini.',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: nomorRekeningController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Nomor Rekening',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelStyle: TextStyle(color: Colors.blue[900]),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor Rekening tidak boleh kosong';
                        } else if (value.length != 10) {
                          return 'Nomor Rekening harus 10 digit';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.0),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextFormField(
                          controller: jumlahTarikanController,
                          inputFormatters: [jumlahTarikanFormatter],
                          decoration: InputDecoration(
                            labelText: 'Jumlah Tarikan',
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.grey[200],
                            labelStyle: TextStyle(color: Colors.blue[900]),
                          ),
                          validator: (value) {
                            String val = value!.replaceAll(".", "");
                            if (value == null || value.isEmpty) {
                              return 'Jumlah Tarikan tidak boleh kosong';
                            } else if (int.parse(val) < 10000) {
                              return 'Minimal IDR 10.000';
                            }
                            return null;
                          },
                        ),
                        Positioned(
                          right: 8,
                          top: 0,
                          bottom: 0,
                          child: Row(
                            children: [
                              Container(
                                width: 2,
                                color: Colors.grey[600],
                                height: 40,
                              ),
                              Text(
                                '  IDR',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(width: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'KLIK DISINI ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            TextSpan(
                              text: 'untuk melihat info biaya',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TarikTunaiHal2(
                                  nomorRekening: nomorRekeningController.text,
                                  jumlahTarikan: jumlahTarikanController.text,
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue[900],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10),
                          child: Text(
                            'Selanjutnya',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
