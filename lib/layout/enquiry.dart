import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:keenapp/layout/botnav.dart';
import 'package:keenapp/layout/draw.dart';
import 'package:keenapp/layout/login.dart';

class enquiry extends StatefulWidget {
  // const enquiry({super.key});
  const enquiry({Key? key}) : super(key: key);


  @override
  State<enquiry> createState() => _enquiryState();
}

class _enquiryState extends State<enquiry> {
  List dropList =[
    {"application_id":0, "job": "<Select>"},
    // {"edpt_id":1, "name": "<two>"},
  ];
  var fkey=GlobalKey<FormState>();
  var val=true;
  var dropdownValue = "";
  // late TextEditingController details,type,fee;
  void gendrop() async {
    var url = Uri.parse(Login.url + "job/ppppp/");
    var resp = await get(url);
    print(resp.body);
    setState(() {
      dropList = jsonDecode(resp.body);
    });
  }
  late TextEditingController enquiryyyy;


  @override
  void initState() {
    enquiryyyy = TextEditingController();
    super.initState();
  }

  void postdata() async {
    var url = Uri.parse(Login.url + "enquiry/enquiry/");
    Response resp = await post(url, body: {
      'enquiry': enquiryyyy.text.toString(),
      'lll':Login.uid,
      'sid':dropdownValue

    });
  }

  @override
  Widget build(BuildContext context) {
    gendrop();
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
                Container( //dropdown
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20), //3rd
                    decoration: BoxDecoration(
                    ),
                    child: DropdownButtonFormField(
                        hint: Text("Select the Application Name"),
                        onChanged: ( newValue) {
                          setState(() {
                            dropdownValue = newValue.toString();
                            print(dropdownValue);
                          });
                        },
                        items: dropList.map((item) => DropdownMenuItem(child: Text(item['job'].toString()),value:item['application_id'].toString(),)).toList()
                    )

                ),
                Container(
                  padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                  child: TextFormField(
                    controller: enquiryyyy,
                    decoration: InputDecoration(
                      labelText: 'Enquiry',
                      hintText: 'Enter your Enquiries here',
                      prefixIcon: Icon(Icons.question_answer_sharp),
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
                        builder: (BuildContext) => enquiry()));
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



