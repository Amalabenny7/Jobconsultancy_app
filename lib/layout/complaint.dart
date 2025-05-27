import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:keenapp/layout/botnav.dart';
import 'package:keenapp/layout/draw.dart';
import 'package:keenapp/layout/login.dart';

class complaint extends StatefulWidget {
  // const complaint({super.key});
  const complaint({Key? key}) : super(key: key);
  @override
  State<complaint> createState() => _complaintState();
}

class _complaintState extends State<complaint> {
  late TextEditingController comp;


  @override
  void initState() {
    comp = TextEditingController();
    super.initState();
  }

  void postdata() async {
    var url = Uri.parse(Login.url + "complaint/post/");
    Response resp = await post(url, body: {
      'complaint': comp.text.toString(),
      'uid':Login.uid
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color(0xFF0D1B2A), // Business Dark Theme
      elevation: 4,
      iconTheme: const IconThemeData(color: Colors.white), // White drawer icon
      title: Row(
        children: [
          Image.asset(
            'assets/images/b.png', // Replace with your logo asset path
            height: 40,
          ),
          const SizedBox(width: 10), // Space between logo and text
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

      drawer: const Draw(),  
      bottomNavigationBar: const botnav(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(230, 2, 26, 61), Color.fromARGB(133, 1, 20, 54)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: comp,
                    decoration: InputDecoration(
                      labelText: 'Complaints',
                      hintText: 'Enter your complaint',
                      prefixIcon: Icon(Icons.report_problem),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 14, 123, 137),
                    ),
                    onPressed: () {
                      postdata();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext) => complaint()));
                    },
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
