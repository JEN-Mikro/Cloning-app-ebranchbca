import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/Login.dart';
import 'package:flutter_app/Screens/Signup.dart';

class OpenApp extends StatefulWidget {
  const OpenApp({Key? key}) : super(key: key);

  @override
  _OpenAppState createState() => _OpenAppState();
}

class _OpenAppState extends State<OpenApp> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                GestureDetector(
                  onTapUp: (details) {
                    if (details.localPosition.dx >
                        MediaQuery.of(context).size.width / 2) {
                      _nextPage();
                    } else {
                      _previousPage();
                    }
                  },
                  child: Container(
                    color: const Color.fromARGB(255, 13, 92, 171),
                    child:
                        Image.asset('assets/images/bca.jpg', fit: BoxFit.cover),
                  ),
                ),
                GestureDetector(
                  onTapUp: (details) {
                    if (details.localPosition.dx >
                        MediaQuery.of(context).size.width / 2) {
                      _nextPage();
                    } else {
                      _previousPage();
                    }
                  },
                  child: Container(
                    color: const Color.fromARGB(255, 13, 92, 171),
                    child: Image.asset('assets/images/bca2.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
                GestureDetector(
                  onTapUp: (details) {
                    if (details.localPosition.dx >
                        MediaQuery.of(context).size.width / 2) {
                      _nextPage();
                    } else {
                      _previousPage();
                    }
                  },
                  child: Container(
                    color: const Color.fromARGB(255, 13, 92, 171),
                    child: Image.asset('assets/images/bca3.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                width: 12.0,
                height: 12.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 60),
                  foregroundColor: Color.fromARGB(255, 13, 92, 171),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 50),
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 13, 92, 171),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'CONTINUE AS GUEST',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 13, 92, 171),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
