import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/models/datast.dart';
import 'package:flutter_app/Setoran_tunai/st4.dart';

class ST3 extends StatefulWidget {
  final FormData formData;

  const ST3({super.key, required this.formData});

  @override
  State<ST3> createState() => _ST3State();
}

class _ST3State extends State<ST3> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                                text: "Pilih ",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: "jenis identitas",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: " dari pemilik sumber dana.",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildIdentityOption(
                          context, 'Rekening', 'assets/images/rekening.jpeg'),
                      const SizedBox(height: 20),
                      _buildIdentityOption(context, 'Kartu Tanda Penduduk',
                          'assets/images/kartu.jpeg'),
                      const SizedBox(height: 20),
                      _buildIdentityOption(
                          context, 'Paspor', 'assets/images/paspor.jpeg'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIdentityOption(
      BuildContext context, String text, String imagePath) {
    return GestureDetector(
      onTap: () {
        FormData updatedFormData = FormData(
          recipientName: widget.formData.recipientName,
          accountNumber: widget.formData.accountNumber,
          amount: widget.formData.amount,
          message: widget.formData.message,
          sourceOwnerName: widget.formData.sourceOwnerName,
          identityType: 'Rekening',
          nomorReferensi: '',
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ST4(formData: updatedFormData),
          ),
        );
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                imagePath,
                width: 48,
                height: 48,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
