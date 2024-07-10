import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/Screens/Login.dart';
import 'package:flutter_app/widgets/textfield_custom.dart';

class LupaPass extends StatefulWidget {
  const LupaPass({super.key});

  @override
  State<LupaPass> createState() => _LupaPassState();
}

class _LupaPassState extends State<LupaPass> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: "");
    _emailController = TextEditingController(text: "");
  }

  Future<void> _handleForgotPassword() async {
    String nama = _namaController.text.trim();
    String email = _emailController.text.trim();

    try {
      var userDoc =
          await FirebaseFirestore.instance.collection('users').doc(email).get();

      if (userDoc.exists && userDoc['nama'] == nama) {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sukses'),
              content: Text('Instruksi reset PIN telah dikirim ke email Anda'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => LoginPage()),
                      (route) => false,
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Nama atau email tidak valid'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      debugPrint("Error: $e");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Error: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 13, 92, 171),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/login.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 10.0, bottom: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lupa PIN',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFieldCustom(
                      ctrl: _namaController,
                      label: 'Nama',
                      focusedBorderColor: Colors.white,
                      textColor: Colors.white,
                      suffix: null,
                    ),
                    TextFieldCustom(
                      ctrl: _emailController,
                      label: 'Email',
                      focusedBorderColor: Colors.white,
                      textColor: Colors.white,
                      suffix: null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: ElevatedButton(
                        onPressed: _handleForgotPassword,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.orange,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10),
                          child: Text(
                            'Reset PIN',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Kembali ke Login',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 77, 175, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
