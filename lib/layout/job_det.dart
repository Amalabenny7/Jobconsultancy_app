import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:keenapp/layout/botnav.dart';
import 'package:keenapp/layout/draw.dart';
import 'dart:convert';

import 'package:keenapp/layout/login.dart';

class job_det extends StatefulWidget {
  static var did;
  const job_det({Key? key}) : super(key: key);

  @override
  State<job_det> createState() => _job_detState();
}

class _job_detState extends State<job_det> {
  List data = [];
  List filteredData = [];
  TextEditingController searchController = TextEditingController();

  void fetchJobList() async {
    var url = Uri.parse("${Login.url}/job/ss/");
    Response resp1 = await post(url,body: {
        'did':job_det.did
    });
    setState(() {
      data = jsonDecode(resp1.body);
      filteredData = data;
    });
  }

  void postdata1(var jid) async {
    var url1 = Uri.parse("${Login.url}job/job_apply/");
    await post(url1, body: {
      'uid': Login.uid,
      'jid': jid.toString(),
    });
  }

  void filterJobs(String query) {
    setState(() {
      filteredData = query.isEmpty
          ? data
          : data.where((job) =>
              job['jobtitle'].toString().toLowerCase().contains(query.toLowerCase()) ||
              job['location'].toString().toLowerCase().contains(query.toLowerCase()) ||
              job['last_date'].toString().toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  void initState() {
    fetchJobList();
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: const Color(0xFF0D1B2A), // Business Dark Theme
  //       elevation: 4,
  //       title: Row(
  //         children: [
  //           Image.asset(
  //             'assets/images/b.png', // Replace with your logo asset path
  //             height: 40,
  //           ),
  //           const SizedBox(width: 10), // Space between logo and text
  //           const Text(
  //             "Keen Job ",
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 20,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search by Job Title...",
                  hintStyle: const TextStyle(color: Colors.white70),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Colors.white24,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: filterJobs,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.white.withOpacity(0.9),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color.fromARGB(255, 4, 29, 65), Color.fromARGB(255, 42, 60, 214)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                filteredData[index]['jobtitle'].toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 224, 229, 231),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                                  buildRow(Icons.description, filteredData[index]['description'].toString()),
                          buildRow(Icons.hourglass_empty, filteredData[index]['number_of_vacancy'].toString()),
                          buildRow(Icons.person, filteredData[index]['gender'].toString()),
                          buildRow(Icons.person, filteredData[index]['age'].toString()),
                          buildRow(Icons.emoji_people, filteredData[index]['experience'].toString()),
                          buildRow(Icons.money, filteredData[index]['salary'].toString()),
                          buildRow(Icons.timer, filteredData[index]['working_time'].toString()),
                          // buildRow(Icons.com, filteredData[index]['c_name'].toString()),
                          // buildRow("Company Details", filteredData[index]['c_details'].toString()),
                          buildRow(Icons.place, filteredData[index]['location'].toString()),
                          buildRow(Icons.date_range, filteredData[index]['last_date'].toString()),
                          buildRow(Icons.school, filteredData[index]['qualification'].toString()),
                          const SizedBox(height: 10),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                postdata1(filteredData[index]['job_id'].toString());
                                showDialog(
                                    context: context,
                                    builder: (context) => const AlertDialog(
                                          content: Text("Successfully Applied"),
                                        ));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 7, 2, 58),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                              ),
                              child: const Text(
                                'Apply Now',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                            
                          ),
//                           Center(
//                             child: ElevatedButton(onPressed: (){

// Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => job_det()),
//     );
//                             }, child: Text('see more')),
//                           )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(IconData icon, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.deepPurpleAccent, size: 20),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
