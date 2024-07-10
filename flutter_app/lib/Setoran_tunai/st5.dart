import 'package:flutter/material.dart';
import 'package:flutter_app/Info_status/Berhasil.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/models/datast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/NoRef_Generator.dart';

class ST5 extends StatelessWidget {
  final FormData formData;

  const ST5({Key? key, required this.formData}) : super(key: key);

  Future<void> _saveTransaction(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      CollectionReference transactions =
          FirebaseFirestore.instance.collection('riwayatTransaksi');

      String nomorReferensi =
          ReferenceGenerator.generateReference('setoran_tunai');

      await transactions.add({
        'uid': user.uid,
        'recipientName': formData.recipientName,
        'accountNumber': formData.accountNumber,
        'amount': formData.amount,
        'message': formData.message,
        'sourceOwnerName': formData.sourceOwnerName,
        'identityType': formData.identityType,
        'timestamp': FieldValue.serverTimestamp(),
        'transactionType': 'Setoran Tunai',
        'nomorReferensi': nomorReferensi,
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Berhasil(
            customText: "Setor Tunai",
            nomorReferensi: nomorReferensi,
          ),
        ),
      );
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _buildProgressIndicator(),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Pastikan semua data yang dimasukkan sudah benar.',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 30, 61, 115)),
                  ),
                  const SizedBox(height: 3),
                  _buildSection(
                    title: 'Data Penerima',
                    content: [
                      'Nama\n${formData.recipientName}',
                      'Nomor Rekening\n${formData.accountNumber}',
                    ],
                    context: context,
                    color: const Color.fromARGB(255, 30, 61, 115),
                    isDarker: false,
                  ),
                  const SizedBox(height: 3),
                  _buildSection(
                    title: 'Transaksi Setoran',
                    content: [
                      'Jumlah\n${formData.amount} IDR',
                      'Berita\n${formData.message}',
                    ],
                    context: context,
                    color: const Color.fromARGB(255, 30, 61, 115),
                    isDarker: true,
                  ),
                  const SizedBox(height: 3),
                  _buildSection(
                    title: 'Data Pemilik Sumber Dana',
                    content: [
                      'Pemilik Sumber Dana\nSaya Sendiri',
                      'Jenis Identitas\n${formData.identityType}',
                    ],
                    context: context,
                    color: const Color.fromARGB(255, 30, 61, 115),
                    isDarker: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () => _saveTransaction(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue[900],
                    minimumSize: const Size(140, 50),
                  ),
                  child: const Text(
                    'Proses',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildProgressIndicator() {
    return [
      Container(
        width: 25,
        height: 25,
        margin: const EdgeInsets.only(right: 4),
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check, color: Colors.white, size: 16),
      ),
      Container(
        width: 35,
        height: 3,
        color: const Color.fromARGB(255, 30, 61, 115),
      ),
      ...List.generate(
        3,
        (index) => Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: index < 2 ? Colors.grey : Colors.blue[900],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: index < 2
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : const Text(
                        '4',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
              ),
            ),
            if (index < 2)
              Container(
                width: 35,
                height: 3,
                color: Colors.blue[900],
              ),
          ],
        ),
      )
    ];
  }

  Widget _buildSection({
    required String title,
    required List<String> content,
    required BuildContext context,
    required Color color,
    required bool isDarker,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            constraints: const BoxConstraints(minWidth: double.infinity),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_drop_down,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 30, 61, 115),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'UBAH',
                  style: TextStyle(
                    color: Color.fromARGB(255, 59, 116, 202),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Row(
                children: content
                    .sublist(0, (content.length / 2).ceil())
                    .asMap()
                    .map((index, item) => MapEntry(
                          index,
                          Expanded(
                            child: _buildContentBox(
                                item, title == 'Data Penerima',
                                isDarker: false),
                          ),
                        ))
                    .values
                    .toList(),
              ),
              Row(
                children: content
                    .sublist((content.length / 2).floor())
                    .asMap()
                    .map((index, item) => MapEntry(
                          index,
                          Expanded(
                            child: _buildContentBox(
                                item, title == 'Data Penerima',
                                isDarker: true),
                          ),
                        ))
                    .values
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContentBox(String content, bool isFirstSection,
      {required bool isDarker}) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isDarker ? const Color.fromARGB(255, 248, 248, 248) : null,
        border: isFirstSection
            ? null
            : Border(
                top: BorderSide(
                    color: isDarker
                        ? const Color.fromARGB(255, 248, 248, 248)
                        : Colors.grey,
                    width: 1),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content.split('\n')[0],
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            content.split('\n')[1],
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
