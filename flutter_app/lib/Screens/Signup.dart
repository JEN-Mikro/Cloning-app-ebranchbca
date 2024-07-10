import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pinController = TextEditingController();
  TextEditingController _replypinController = TextEditingController();
  bool _masukanPin = true;
  bool _replyPin = true;

  void _handleSignup() async {
    String pin = _pinController.text;
    String replypin = _replypinController.text;

    if (pin != replypin || pin.length != 6) {
      debugPrint(
          "Sign Up Gagal: PIN tidak cocok atau tidak memiliki tepat 6 digit");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _pinController.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(_emailController.text.trim())
          .set({
        'nama': _namaController.text.trim(),
        'email': _emailController.text.trim(),
        'pin': _pinController.text.trim(),
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    } catch (e) {
      debugPrint("Sign Up Gagal: $e");
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
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Akun',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _pinController,
                      obscureText: _masukanPin,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Masukkan PIN (6 digit)',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        counterText: '',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _masukanPin = !_masukanPin;
                            });
                          },
                          child: Icon(
                            _masukanPin
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _replypinController,
                      obscureText: _replyPin,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Ulangi PIN',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        counterText: '',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _replyPin = !_replyPin;
                            });
                          },
                          child: Icon(
                            _replyPin ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {},
                      child: Text.rich(
                        TextSpan(
                          text: "Dengan mendaftar, kamu menyetujui ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: "ketentuan",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 77, 175, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " aplikasi eBranch BCA",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: ElevatedButton(
                        onPressed: _handleSignup,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20),
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
                      child: Text.rich(
                        TextSpan(
                          text: 'Sudah punya akun? ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'LOG IN',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 77, 175, 255),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
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
