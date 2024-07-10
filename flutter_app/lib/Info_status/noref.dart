import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/home.dart';

class Noref extends StatelessWidget {
  final String referencePrefix;
  final String referenceNumber;

  Noref({required this.referencePrefix, required this.referenceNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[900]!, Colors.white],
            stops: [0.5, 0.5],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                    255,
                    110,
                    203,
                    57,
                  ),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 48,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Pengisian Form Berhasil',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 20,
                  ),
                ),
                child: Image.asset(
                  'assets/images/qr.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'NOMOR REFERENSI',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                referenceNumber,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'ⓘ Harap screenshot halaman ini karena nomor referensi di atas dibutuhkan untuk melakukan transaksi di Teller / CS.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BcaHome()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                  child: Text(
                    'Selesai',
                    style: TextStyle(
                      fontSize: 22,
                    ),
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
