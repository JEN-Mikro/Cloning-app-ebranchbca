import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/models/datast.dart';
import 'package:flutter_app/Setoran_tunai/st5.dart';

class ST4 extends StatefulWidget {
  final FormData formData;

  const ST4({super.key, required this.formData});

  @override
  State<ST4> createState() => _ST4State();
}

class _ST4State extends State<ST4> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _noHp = TextEditingController();
  final TextEditingController _noTlp = TextEditingController();
  final TextEditingController _sourceOwnerNameController =
      TextEditingController();
  late FormData formData;

  @override
  void initState() {
    super.initState();
    formData = widget.formData;
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
                const SizedBox(width: 15),
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 0),
                Container(
                  width: 35,
                  height: 3,
                  color: Colors.blue[900],
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 0),
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
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 0),
                Container(
                  width: 35,
                  height: 3,
                  color: Colors.grey,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(text: 'Lengkapi '),
                    TextSpan(
                      text: 'data pemilik sumber dana ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'di\n'),
                    TextSpan(
                      text: "bawah ini",
                      style: TextStyle(
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
                        controller: _sourceOwnerNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama yang Dapat Dihubungi belum diisi';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Nama',
                          labelStyle: const TextStyle(color: Colors.grey),
                          contentPadding:
                              const EdgeInsets.fromLTRB(12, 5, 12, 5),
                          floatingLabelStyle: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                          ),
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
                            return 'No. Rekening belum diisi';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Nomor Rekening',
                          labelStyle: const TextStyle(color: Colors.grey),
                          contentPadding:
                              const EdgeInsets.fromLTRB(12, 5, 12, 5),
                          floatingLabelStyle: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                          ),
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
                        controller: _noTlp,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'No. Telepon yang Dapat Dihubungi belum diisi';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Nomor Handphone',
                          labelStyle: const TextStyle(color: Colors.grey),
                          contentPadding:
                              const EdgeInsets.fromLTRB(12, 5, 12, 5),
                          floatingLabelStyle: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                          ),
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            formData = FormData(
                              recipientName: widget.formData.recipientName,
                              accountNumber: widget.formData.accountNumber,
                              amount: widget.formData.amount,
                              message: widget.formData.message,
                              sourceOwnerName: _sourceOwnerNameController.text,
                              identityType: widget.formData.identityType,
                              nomorReferensi: '',
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ST5(formData: formData),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(
                            150,
                            50,
                          ),
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
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [],
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
