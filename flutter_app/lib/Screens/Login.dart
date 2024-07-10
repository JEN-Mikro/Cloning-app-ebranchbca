import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/Screens/LupaPass.dart';
import 'package:flutter_app/Screens/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pinController = TextEditingController();
  bool _obscurePin = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadLoginInfo();
  }

  Future<void> _saveLoginInfo(String email, String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('pin', pin);
  }

  Future<void> _loadLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPin = prefs.getString('pin');

    if (savedEmail != null && savedPin != null) {
      setState(() {
        _emailController.text = savedEmail;
        _pinController.text = savedPin;
        _rememberMe = true;
      });
    }
  }

  void _handleLogin() async {
    String email = _emailController.text.trim();
    String pin = _pinController.text.trim();

    if (pin.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PIN harus 6 digit')),
      );
      return;
    }

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pin,
      );

      if (userCredential.user != null) {
        if (_rememberMe) {
          await _saveLoginInfo(email, pin);
        } else {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.remove('email');
          await prefs.remove('pin');
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => BcaHome()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed')),
        );
      }
    } catch (e) {
      debugPrint("Login Gagal: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Gagal: $e')),
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
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
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
                      obscureText: _obscurePin,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      decoration: InputDecoration(
                        labelText: 'PIN Aplikasi',
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscurePin = !_obscurePin;
                            });
                          },
                          child: Icon(
                            _obscurePin
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                        ),
                        counterText: "",
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _rememberMe = !_rememberMe;
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.white),
                              color: _rememberMe
                                  ? Colors.blue
                                  : Colors.transparent,
                            ),
                            child: _rememberMe
                                ? Icon(
                                    Icons.check,
                                    size: 16,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: ElevatedButton(
                        onPressed: _handleLogin,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.orange,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10),
                          child: Text(
                            'Log In',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LupaPass()),
                        );
                      },
                      child: Text(
                        'Lupa PIN aplikasi ?',
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
