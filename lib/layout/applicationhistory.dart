import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'dart:convert';

import 'package:keenapp/layout/login.dart';



class ApplicationHistory extends StatefulWidget {
  const ApplicationHistory({Key? key}) : super(key: key);

  @override
  State<ApplicationHistory> createState() => _ApplicationHistoryState();
}

class _ApplicationHistoryState extends State<ApplicationHistory> {
  late List data;
  void List_function() async {
    var url = Uri.parse('${Login.url}job/history/');
    Response resp1 = await post(url,body: {
      'uid':Login.uid
    });
    
    // data = jsonDecode(resp1.body);
    setState(() {
      data = jsonDecode(resp1.body);
      
    });
    print(resp1.body);

  }

  @override
  Widget build(BuildContext context) {
    List_function();
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black,
        title: Text("View Application History",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white) ,) ,
      ),
     body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: 
            [Colors.black,Colors.blue.shade500]
            ),
              image: const DecorationImage(
                image: AssetImage(''),
                fit: BoxFit.cover,
              )
          ),
          child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            // itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 05, 10, 5),
                child: Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)
                  ),
                  child: InkWell(
                    onTap: () {
                      print("tapped");
                      //  tap funtion here

                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Application Id : "" "+data[index]['application_id'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                              const SizedBox(height: 6.0),
                              // Image.network(mainpage.url+"static/"+data[index]['pmr'].toString()),
                              Text("Job : "" "+data[index]['job'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                              ),
                              const SizedBox(height: 6.0),

                              Text("${('Status: ' ).toUpperCase()} ${data[index]['status']}", style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),

                              
                              Text("${('Date: ' ).toUpperCase()} ${data[index]['date']}", style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              
                              Text("${('Time: ' ).toUpperCase()} ${data[index]['time']}", style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                             
                              
                              
                              const SizedBox(height: 6.0),

                              


                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
      ),
    );
    
  }
}






