
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:keenapp/layout/login.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
  static var usid = "";
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController name,place,ph_no,email,qualification,experience,username,password;
  late List data;
  bool isLoading = true;  // Track loading state

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    place = TextEditingController();
    ph_no = TextEditingController();
    email = TextEditingController();
    qualification = TextEditingController();
    experience = TextEditingController();
    username = TextEditingController();
    password = TextEditingController();
    fetchUserData();
  }

  void fetchUserData() async {
    var url = Uri.parse(Login.url + "/user/ccc/");
    Response resp1 = await post(url, body: {
      "usid": Login.uid.toString(),
    });
    
    if (resp1.statusCode == 200) {
      data = jsonDecode(resp1.body);
      setState(() {
        name.text = data[0]["name"].toString();
        place.text = data[0]["place"].toString();
        ph_no.text = data[0]["ph_no"].toString();
        email.text = data[0]["email"].toString();
        qualification.text = data[0]["qualification"].toString();
        experience.text = data[0]["experience"].toString();
        username.text = data[0]["username"].toString();
        password.text = data[0]["password"].toString();
        isLoading = false; // Stop loading after data is fetched
      });
    } else {
      // Handle error if response is not successful
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: ${resp1.statusCode}');
    }
  }

  void postData() async {
        var url = Uri.parse(Login.url + "/user/update/");
    // String url = Login.url + "/user/update/";
    var resp = await post(url, body: {
      "usid": Login.uid.toString(),
      "name": name.text,
      "place": place.text,
      "ph_no": ph_no.text,
      "email": email.text,
       "qualification": qualification.text,
      "experience": experience.text,
      "username": username.text,
      "password": password.text,
    });

    if (resp.statusCode == 200) {
      // Successfully updated
      print('Profile updated successfully');
      Navigator.of(context).pop(); // Navigate back after update
    } else {
      // Handle error if update fails
      print('Failed to update profile: ${resp.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topRight,
        //     end: Alignment.bottomLeft,
        //     colors: [
        //       Color.fromARGB(255, 32, 26, 48),
        //       Color.fromARGB(255, 32, 26, 48),
        //     ],
        //   ),
        // ),
        decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('asset/b.jpg'),
      fit: BoxFit.cover,
    )
),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Update",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      if (isLoading) 
                        CircularProgressIndicator() // Show loading indicator while fetching data
                      else ...[
                        // Name input
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                              labelText: "Name",
                              prefixIcon: Icon(Icons.people),
                            ),
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: place,
                            decoration: InputDecoration(
                              labelText: "Place",
                              prefixIcon: Icon(Icons.place),
                            ),
                          ),
                        ),
                        // Phone number input
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: ph_no,
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        // Address input
                       
                        // Email input
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: qualification,
                            decoration: InputDecoration(
                              labelText: "Qualification",
                              prefixIcon: Icon(Icons.note),
                            ),
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: experience,
                            decoration: InputDecoration(
                              labelText: "Experience",
                              prefixIcon: Icon(Icons.description),
                            ),
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: username,
                            decoration: InputDecoration(
                              labelText: "Username",
                              prefixIcon: Icon(Icons.people),
                            ),
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.password),
                            ),
                          ),
                        ),
                        // Update button
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                          child: ElevatedButton(
                            onPressed: () {
                              postData();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.tealAccent, // Background color
                            ),
                            child: Text("Update"),
                          ),
                        ),
                      ],
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