

import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:keenapp/layout/register.dart';
import 'view_job.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
  static var uid = "";
  static var url = "http://192.168.169.92:8000/";
}

class _LoginState extends State<Login> {
  late TextEditingController username, password;
  var data = [];
  bool _isVisible = false;

  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  void postdata() async {
    var url1 = Uri.parse("${Login.url}login/flutter/");
    Response resp = await post(url1, body: {
      "username": username.text.trim(),
      "password": password.text.trim(),
    });
    data = jsonDecode(resp.body);
    if (data.isNotEmpty) {
      Login.uid = data[0]['u_id'].toString();
      if (data[0]['type'] == "user") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const ViewJob()));
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                content: Text("You have successfully logged in")));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
              content: Text("Invalid username or password")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D1B2A), 
        elevation: 4,
        title: Row(
          children: [
            Image.asset(
              'assets/images/b.png', 
              height: 40,
            ),
            const SizedBox(width: 10), 
            const Text(
              "Keen Job ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF02040F), Color(0xFF0D1B2A)], // Dark Business Colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Sign in to continue",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 25),

                // Glassmorphism Login Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1), // Transparent Glass Effect
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Username Field
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: username,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: const TextStyle(color: Colors.white70),
                            labelText: 'Username',
                            labelStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(Icons.person, color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white54),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Password Field
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: password,
                          obscureText: !_isVisible,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.white70),
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.white),
                            prefixIcon: const Icon(Icons.lock, color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.white70,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white54),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Login Button
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: postdata,
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF1B263B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                          children: [
                            TextSpan(
                              text: "Register",
                              style: const TextStyle(
                                color: Colors.cyanAccent,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const user_registration(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

