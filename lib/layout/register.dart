import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart';
import 'package:keenapp/layout/login.dart';
import 'package:intl/intl.dart';

class user_registration extends StatefulWidget {
  const user_registration({Key? key}) : super(key: key);

  @override
  State<user_registration> createState() => _user_registrationState();
}

class _user_registrationState extends State<user_registration> {
  var file,objfile;
  var file2,objfile2;
  late TextEditingController name,place,ph_no,email,photo,dob,interest,gender,cv,adrees,qualification,pincode,password,username,experience;
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Set initial date
      firstDate: DateTime(1900), // Minimum selectable date
      lastDate: DateTime.now(), // Maximum selectable date
    );

    if (picked != null) {
      setState(() {
        dob.text = DateFormat('yyyy-MM-dd').format(picked); // Format date
      });
    }
  }

  bool validateEmail(String value) {
    var email = value;
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    print(emailValid);
    return emailValid;
  }
  bool validatephone(String value){
    var ph=value;
    bool phone=RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(ph);
    return phone;

  }

  int _value=1;
  @override
  void initState(){
    name=TextEditingController();
    place=TextEditingController();
    ph_no=TextEditingController();
    email=TextEditingController();
    photo=TextEditingController();
    dob=TextEditingController();
    interest=TextEditingController();
    gender=TextEditingController();
    cv=TextEditingController();
    adrees=TextEditingController();
    qualification=TextEditingController();
    pincode=TextEditingController();
    password=TextEditingController();
    username=TextEditingController();
    experience=TextEditingController();
    // Gender=TextEditingController();
    super.initState();
  }
  void postdata()async{
    var url = Uri.parse("${Login.url}/user/user/");
    var Gender;
    if (_value==1)
    {
      Gender="Male";
    }
    else if(_value==2)
    {
      Gender="Female";
    }

    if (name.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Name")));
    }
     if (place.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Place")));
    }
    else if(!validatephone(ph_no.text))
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required valid phone number")));
    }
    else if (!validateEmail(email.text))
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required  valid email")));
    }
    else if(dob.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required dob")));
    }
     else if(interest.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required Intrest")));
    }
    
    
    else if(_value=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required gender")));
    }
    
     else if(adrees.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required address")));
    }
     else if(qualification.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required qualification")));
    }
     else if(pincode.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required pincode")));
    }
     else if(experience.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required Experience")));
    }
    else if(username.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required Username")));
    }
     else if(password.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required Password")));
    }
    else{

      var resp=await post(url,body: {
        "name":name.text.toString(),
        "place":place.text.toString(),
        "ph_no":ph_no.text.toString(),
        "email":email.text.toString(),
        "photo":photo.text.toString(),
        "dob":dob.text.toString(),
        "interest":interest.text.toString(), 
        "gender":Gender,
        "cv":cv.text.toString(),
        "adrees":adrees.text.toString(),
        "qualification":qualification.text.toString(),
        "pincode":pincode.text.toString(),
        "experience":experience.text.toString(),
        "username":username.text.toString(),
        "password":password.text.toString()

      });
    }
       print(Login.url+"/user/img/");
    final request = MultipartRequest("POST",Uri.parse(Login.url+"/user/img/"));
      request.fields["id"]="photo";
      request.files.add(MultipartFile("file",objfile.readStream, objfile.size,filename:objfile.name));
      var resp1=await request.send();
      final respStr = await resp1.stream.bytesToString();

    final request2 = MultipartRequest("POST",Uri.parse(Login.url+"/user/cv/"));
      request2.fields["id"]="certification";
      request2.files.add(MultipartFile("file",objfile2.readStream, objfile2.size,filename:objfile2.name));
      var resp2=await request2.send();
      final respStr2 = await resp2.stream.bytesToString();

      // print('File upload Response: $respStr');
      // print('File2 upload Response: $respStr2');

 }
 upload_file()async{
  // print('File Uploaded Successfully');
  var result = await FilePicker.platform.pickFiles(withReadStream: true);
  if(result != null){
    setState(() {
      file = result.files.first.name;
      objfile=result.files.single;
      photo.text=file;
    });
  }else{ print('File Selection cancelled. ');}
 }

 upload_file2()async{
  print('File2 Uploaded Successfully');
  var result = await FilePicker.platform.pickFiles(withReadStream: true);
  if(result != null){
    setState(() {
      file2 = result.files.first.name;
      objfile2=result.files.single;
      cv.text=file;
    });
  }else{ print('File2 Selection cancelled. ');}
 }
      
  
  bool passwordVisible=false;
  @override


  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Keen App",
          style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blueGrey,
              Colors.black
            ]
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
                child: Text("REGISTRATION",
                  style: TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 9, 31, 69)
                  ),),
              ),
              Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
  child: TextFormField(
    controller: name,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: "NAME",
      labelStyle: TextStyle(color: Colors.black), // Change label text color
      hintText: "name",
      hintStyle: TextStyle(color: Colors.black), // Change hint text color
      prefixIcon: Icon(Icons.person, color: Colors.black), // Change icon color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Change border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2), // Change border color when focused
      ),
    ),
  ),
),
Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
  child: TextFormField(
    controller: place,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: "Place",
      labelStyle: TextStyle(color: Colors.black), // Change label text color
      hintText: "place",
      hintStyle: TextStyle(color: Colors.black), // Change hint text color
      prefixIcon: Icon(Icons.location_city, color: Colors.black), // Change icon color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Change border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2), // Change border color when focused
      ),
    ),
  ),
),


           Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
  child: TextFormField(
    controller: ph_no,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: "PHONE NUMBER",
      labelStyle: TextStyle(color: Colors.black), // Change label text color
      hintText: "phone number",
      hintStyle: TextStyle(color: Colors.black), // Change hint text color
      prefixIcon: Icon(Icons.mobile_friendly, color: Colors.black), // Change icon color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Change border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2), // Change border color when focused
      ),
    ),
  ),
),
      Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
  child: TextFormField(
    controller: email,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: "EMAIL",
      labelStyle: TextStyle(color: Colors.black), // Change label text color
      hintText: "email",
      hintStyle: TextStyle(color: Colors.black), // Change hint text color
      prefixIcon: Icon(Icons.email, color: Colors.black), // Change icon color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Change border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2), // Change border color when focused
      ),
    ),
  ),
),   
   Container(
  padding: EdgeInsets.symmetric(vertical: 5.0), // Adjust vertical padding
  width: 200, // Set a fixed smaller width
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 3.0, // Reduce elevation if needed
      padding: EdgeInsets.all(12.0), // Decrease padding inside button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Reduce border radius
      ),
      primary: Colors.white, // Button background color
    ),
    onPressed: () {
      upload_file();
    },
    child: Text(
      'Upload Photo', // Shortened text to fit smaller size
      style: TextStyle(
        color: Color(0xFF072850),
        letterSpacing: 1.2,
        fontSize: 12.0, // Slightly smaller font size
        fontWeight: FontWeight.bold,
        fontFamily: 'OpenSans',
      ),
    ),
  ),
),
Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
  child: TextFormField(
    controller: dob, // Controller for selected date
    readOnly: true, // Prevent manual editing
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: "DOB",
      labelStyle: TextStyle(color: Colors.black), // Label text color
      hintText: "Select Date",
      hintStyle: TextStyle(color: Colors.black), // Hint text color
      prefixIcon: Icon(Icons.calendar_today, color: Colors.black), // Calendar icon
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2), // Focused border color
      ),
    ),
    onTap: () => _selectDate(context), // Open date picker on tap
  ),
),
               
             Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0), // Match DOB padding
  child: InputDecorator(
    decoration: InputDecoration(
      labelText: "Gender",
      labelStyle: TextStyle(color: Colors.black), // Match label text color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Match border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2), // Match focused border color
      ),
      prefixIcon: Icon(Icons.person, color: Colors.black), // Add gender icon
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start, // Align content
      children: [
        Radio(
          value: 1,
          groupValue: _value,
          onChanged: (value) {
            setState(() {
              _value = 1;
            });
          },
        ),
        Text("Male", style: TextStyle(color: Colors.black, fontSize: 14)), // Match text style
        SizedBox(width: 10), // Add spacing
        Radio(
          value: 2,
          groupValue: _value,
          onChanged: (value) {
            setState(() {
              _value = 2;
            });
          },
        ),
        Text("Female", style: TextStyle(color: Colors.black, fontSize: 14)), // Match text style
      ],
    ),
  ),
),

              Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
                child: DropdownButtonFormField<String>(
                  value: interest.text.isEmpty ? null : interest.text,
                  decoration: InputDecoration(
                    labelText: "INTEREST",
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Select interest",
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.description, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  items: [
                    'Software Developer',
                    'Content Writer',
                    'Music Producer',
                    'Fitness Trainer',
                    'Marketing Manager',
                    'Psychologist',
                    'Research Scientist',
                    'Photographer',
                  ].map((interestOption) {
                    return DropdownMenuItem<String>(
                      value: interestOption,
                      child: Text(interestOption),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      interest.text = value!;
                    });
                  },
                ),
              ),


              Container(
  padding: EdgeInsets.symmetric(vertical: 5.0), // Adjust vertical padding
  width: 180, // Set a fixed smaller width
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 3.0, // Reduce elevation for a more compact look
      padding: EdgeInsets.all(12.0), // Reduce button padding
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Reduce border radius
      ),
      primary: Colors.white, // Button background color
    ),
    onPressed: () {
      upload_file2();
    },
    child: Text(
      'Upload CV',
      style: TextStyle(
        color: Color(0xFF072850),
        letterSpacing: 1.2,
        fontSize: 12.0, // Slightly smaller font size
        fontWeight: FontWeight.bold,
        fontFamily: 'OpenSans',
      ),
    ),
  ),
),

              Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
  child: TextFormField(
    controller: adrees,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: "ADDRESS",
      labelStyle: TextStyle(color: Colors.black), // Change label text color
      hintText: "address",
      hintStyle: TextStyle(color: Colors.black), // Change hint text color
      prefixIcon: Icon(Icons.location_city_outlined, color: Colors.black), // Change icon color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Change border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2), // Change border color when focused
      ),
    ),
  ),
),
             Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
  child: TextFormField(
    controller: qualification,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: "QUALIFICATION",
      labelStyle: TextStyle(color: Colors.black), // Change label text color
      hintText: "Qualification",
      hintStyle: TextStyle(color: Colors.black), // Change hint text color
      prefixIcon: Icon(Icons.high_quality, color: Colors.black), // Change icon color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Change border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2), // Change border color when focused
      ),
    ),
  ),
),
              Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
  child: TextFormField(
    controller: pincode,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: "PINCODE",
      labelStyle: TextStyle(color: Colors.black), // Change label text color
      hintText: "pincode",
      hintStyle: TextStyle(color: Colors.black), // Change hint text color
      prefixIcon: Icon(Icons.pin, color: Colors.black), // Change icon color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Change border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2), // Change border color when focused
      ),
    ),
  ),
),
             Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
  child: TextFormField(
    controller: experience,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: "EXPERIENCE",
      labelStyle: TextStyle(color: Colors.black), // Change label text color
      hintText: "Experience",
      hintStyle: TextStyle(color: Colors.black), // Change hint text color
      prefixIcon: Icon(Icons.note_add_sharp, color: Colors.black), // Change icon color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Change border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2), // Change border color when focused
      ),
    ),
  ),
),
              Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
  child: TextFormField(
    controller: username,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: "USERNAME",
      labelStyle: TextStyle(color: Colors.black), // Change label text color
      hintText: "Username",
      hintStyle: TextStyle(color: Colors.black), // Change hint text color
      prefixIcon: Icon(Icons.person, color: Colors.black), // Change icon color
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Change border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2), // Change border color when focused
      ),
    ),
  ),
),
            
                 Container(
  padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
  child: TextFormField(
    controller: password,
    obscureText: true, // Hide password
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: "PASSWORD",
      labelStyle: TextStyle(color: Colors.black), // Change label text color
      hintText: "password",
      hintStyle: TextStyle(color: Colors.black), // Change hint text color
      prefixIcon: Icon(Icons.lock, color: Colors.black), // Lock icon
      suffixIcon: Icon(Icons.visibility_off, color: Colors.black), // Eye icon
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black), // Change border color
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2), // Change border color when focused
      ),
    ),
  ),
),

              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: ElevatedButton
                    (
                    onPressed: () {
                      postdata();
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Login()));
                    },
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.blue, // Set the button's background color.
                      // onPrimary: Colors.white, // Set the button's text color.
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 125),
                      // Adjust button padding.
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            16), // Set the button's corner radius.
                      ),
                      elevation: 5,
                      // Set the button's elevation.
                      shadowColor: Colors
                          .blue[800], // Set the button's shadow color.
                    ),
                    
                    child: Text("Register",
                    
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
