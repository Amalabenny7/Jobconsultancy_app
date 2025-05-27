import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:keenapp/layout/login.dart';

class Apply_Job extends StatefulWidget {
  const Apply_Job({Key? key}) : super(key: key);

  @override
  State<Apply_Job> createState() => _Apply_JobState();
}

class _Apply_JobState extends State<Apply_Job> {
  late TextEditingController feedback;
  @override
  void initState(){
    feedback=TextEditingController();
    super.initState();
  }
  void postdata()async{
    var url=Uri.parse("${Login.url}");
    var resp=await post(url,body: {
      'uid':Login.uid
      // "uid":login.uid
    });
    print(resp.body);
  }
  bool passwordVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply for Job",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
                child: Text("",
                  style: TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 9, 31, 69)
                  ),),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20,right: 20,bottom: 0,top: 10),

              //   child: Container(

              //     padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              //     decoration: BoxDecoration(color: Color(0xffb4b4b4).withOpacity(0.4),
              //       // border:Border.all(),
              //       borderRadius: BorderRadius.circular(16),
              //     ),
              //     child: TextFormField(
              //       controller: feedback,
              //       decoration: InputDecoration(
              //         // labelText: 'Name',
              //         hintText: "Feedback",
              //         prefixIcon: Icon
              //           (Icons.people),
              //         border: InputBorder.none,
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: ElevatedButton
                    (
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 125),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            16), // Set the button's corner radius.
                      ),
                      elevation: 5,
                      // Set the button's elevation.
                      shadowColor: Colors
                          .blue[800], // Set the button's shadow color.
                    ),
                    child: const Text("Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),),
                  ),
                ),
              )
            ],),
          ),
        ),
      ),
    );

  }
}