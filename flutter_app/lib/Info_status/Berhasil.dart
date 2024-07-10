import 'package:flutter/material.dart';
import 'package:flutter_app/Info_status/noref.dart';
import 'package:flutter_app/NoRef_Generator.dart';

class Berhasil extends StatelessWidget {
  final String customText;
  final String nomorReferensi;

  const Berhasil({
    Key? key,
    required this.customText,
    required this.nomorReferensi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              Image.asset(
                'assets/images/berhasil.jpg',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
              Text(
                "Kamu berhasil mengisi form",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                customText,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: 150,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 40,
                        left: 0,
                        right: 0,
                        child: ElevatedButton(
                          onPressed: () {
                            saveReferenceNumber(nomorReferensi);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Noref(
                                  referencePrefix: 'TS',
                                  referenceNumber: nomorReferensi,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "Selanjutnya",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void saveReferenceNumber(String referenceNumber) {
  print('Saving reference number: $referenceNumber');
}
