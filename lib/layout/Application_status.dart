import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:keenapp/layout/login.dart';


class ApplicationStatus extends StatefulWidget {
  const ApplicationStatus({Key? key}) : super(key: key);

  @override
  State<ApplicationStatus> createState() => _ApplicationStatusState();
}

class _ApplicationStatusState extends State<ApplicationStatus> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var url = Uri.parse(Login.url + "job/sts/");
    Response response = await post(url,body: {
      'uid':Login.uid
    });
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D1B2A),
        title: const Text(
          "Application Status",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E2A47), Color(0xFF4A5D82)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: data.isEmpty
            ? const Center(child: CircularProgressIndicator(color: Colors.white))
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  String jobTitle = data[index]['job'] ?? "Not Available";
                  String status = data[index]['status'] ?? "Unknown";
                  Color statusColor;
                  Color statusBg;
                  IconData statusIcon;

                  if (status.toLowerCase() == "accepted") {
                    statusColor = Colors.green;
                    statusBg = Colors.green.withOpacity(0.2);
                    statusIcon = Icons.check_circle;
                  } else if (status.toLowerCase() == "pending") {
                    statusColor = Colors.orange;
                    statusBg = Colors.orange.withOpacity(0.2);
                    statusIcon = Icons.hourglass_empty;
                  } else {
                    statusColor = Colors.red;
                    statusBg = Colors.red.withOpacity(0.2);
                    statusIcon = Icons.cancel;
                  }

                  return Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8, // Reduce width to 80% of screen
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.work, color: Color(0xFF1E2A47), size: 18),
                                  const SizedBox(width: 6.0),
                                  Expanded(
                                    child: Text(
                                      jobTitle,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF1E2A47),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: statusBg,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(statusIcon, color: statusColor, size: 16),
                                    const SizedBox(width: 6.0),
                                    Text(
                                      status.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: statusColor,
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
                },
              ),
      ),
    );
  }
}
