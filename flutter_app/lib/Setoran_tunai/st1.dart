import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/models/datast.dart';
import 'package:flutter_app/Setoran_tunai/st2.dart';

class ST1 extends StatefulWidget {
  const ST1({super.key});

  @override
  State<ST1> createState() => _ST1State();
}

class _ST1State extends State<ST1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nama = TextEditingController();
  final TextEditingController _noHp = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _beritaController = TextEditingController();
  FormData formData = FormData(
      recipientName: '',
      accountNumber: '',
      amount: '',
      message: '',
      sourceOwnerName: '',
      identityType: 'Rekening',
      nomorReferensi: '');

  bool _saveToTransferList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[900],
        title: Row(
          children: [
            SizedBox(width: 10),
            Text(
              'Setoran Tunai',
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
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 15),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 0),
                Container(
                  width: 30,
                  height: 2,
                  color: const Color.fromARGB(255, 221, 219, 219),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 221, 219, 219),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 0),
                Container(
                  width: 30,
                  height: 2,
                  color: const Color.fromARGB(255, 221, 219, 219),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 221, 219, 219),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 0),
                Container(
                  width: 30,
                  height: 2,
                  color: const Color.fromARGB(255, 221, 219, 219),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 221, 219, 219),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Lengkapi ",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: "data penerima",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: " dibawah ini.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
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
                                      return 'Nama belum diisi';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Nama',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(12, 5, 12, 5),
                                    floatingLabelStyle:
                                        TextStyle(color: Colors.white),
                                    border: InputBorder.none,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(height: 15),
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
                                      return 'Nomor Rekening belum diisi';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Nomor Rekening',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(12, 5, 12, 5),
                                    floatingLabelStyle:
                                        TextStyle(color: Colors.white),
                                    border: InputBorder.none,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Checkbox(
                                    value: _saveToTransferList,
                                    onChanged: (value) {
                                      setState(() {
                                        _saveToTransferList = value ?? false;
                                      });
                                    },
                                  ),
                                  const Text('Simpan ke Daftar Transfer'),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          TextFormField(
                                            controller: _jumlahController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Jumlah belum diisi';
                                              }
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              labelText: 'Jumlah',
                                              labelStyle:
                                                  TextStyle(color: Colors.grey),
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      12, 5, 12, 5),
                                              border: InputBorder.none,
                                              floatingLabelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                            ),
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
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
                                                const Text(
                                                  '  IDR',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                const SizedBox(width: 8),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextFormField(
                                  controller: _beritaController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Berita belum diisi';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Berita',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(12, 5, 12, 5),
                                    suffixIcon: Icon(Icons.info_outline),
                                    border: InputBorder.none,
                                  ),
                                  maxLines: 3,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                height: 2,
                                color: Colors.grey[200],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Buat jadi Transaksi Berkala',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.grey[200],
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text('Ya'),
                                        ),
                                        Container(
                                          width: 50,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.blue[900],
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'Tidak',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.centerLeft,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      formData = FormData(
                                        recipientName: _nama.text,
                                        accountNumber: _noHp.text,
                                        amount: _jumlahController.text,
                                        message: _beritaController.text,
                                        sourceOwnerName: '',
                                        identityType: '',
                                        nomorReferensi: '',
                                      );

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ST2(formData: formData),
                                        ),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(150, 50),
                                    backgroundColor: Colors.blue[900],
                                  ),
                                  child: const Padding(
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
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
