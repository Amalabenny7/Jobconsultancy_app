import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:keenapp/layout/botnav.dart';
import 'package:keenapp/layout/draw.dart';
import 'package:keenapp/layout/login.dart';

class feee extends StatefulWidget {
  // const feee({super.key});
  const feee({Key? key}) : super(key: key);

  @override
  State<feee> createState() => _feeeState();
}

class _feeeState extends State<feee> {
  late TextEditingController feeeedback,ree;


  @override
  void initState() {
    feeeedback = TextEditingController();
    ree=TextEditingController();
    super.initState();
  }

  void postdata() async {
    var url = Uri.parse(Login.url + "feedback/ffff/");
    Response resp = await post(url, body: {
      'feedback': feeeedback.text.toString(),
      'review':ree.text.toString(),
      'kkk':Login.uid
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
                    controller: feeeedback,
                    decoration: InputDecoration(
                      labelText: 'Feedbacks',
                      hintText: 'Enter your Feedbacks',
                      prefixIcon: Icon(Icons.feed),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: ree,
                    decoration: InputDecoration(
                      labelText: 'Review',
                      hintText: 'Enter your Reviews',
                      prefixIcon: Icon(Icons.reviews),
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
                        builder: (BuildContext) => feee()));
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
