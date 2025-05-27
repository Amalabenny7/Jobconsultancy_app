import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:keenapp/layout/login.dart';
import 'package:file_picker/file_picker.dart';
class agreement extends StatefulWidget {
  const agreement({Key? key}) : super(key: key);
  @override
  State<agreement> createState() => _agreementState();
}
class _agreementState extends State<agreement> {
  List dropList =[
    {"application_id":0, "application_id": "<Select>"},
    // {"edpt_id":1, "name": "<two>"},
  ];
  var fkey=GlobalKey<FormState>();
  var val=true;
  var dropdownValue = "";
  // late TextEditingController details,type,fee;
  void gendrop() async {
    var url = Uri.parse(Login.url + "job/aa/");
    var resp = await get(url);
    print(resp.body);
    setState(() {
      dropList = jsonDecode(resp.body);
    });
  }
  var file,objfile;
  late TextEditingController signn;
  @override
  void initState() {
    super.initState();
    signn = TextEditingController();
  }
  void postdata() async {
    var url = Uri.parse(Login.url + "agreement/aaa/");
    Response resp = await post(url, body: {
      'sign': signn.text.toString(),
      'kk':Login.uid,
      'aid':dropdownValue
    });

    if (resp.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to submit sign.')),
      );
    }
    final request = MultipartRequest(
        "POST", Uri.parse(Login.url+"agreement/up/"));
    request.fields["id"] = "bus";
    request.files.add(MultipartFile(
        file, objfile.readstream, objfile.size,filename:objfile.name));
    var resp1 = await request.send();
    final respStr = await resp1.stream.bytesToString();
  }
  upload_file()async{
    print('Uploaded Successfully');
    var result=await FilePicker.platform.pickFiles(withReadStream:true);
    if(result!=null){
      setState(() {
        file=result.files.first.name;
        objfile=result.files.single;
        signn.text=file;
      });
    }else{
    }
  }

  bool _isAgreed = false;

  void _onSubmit() {
    if (_isAgreed) {
      postdata(); 
      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext) => agreement()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Agreement Accepted')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to the contracts.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    gendrop();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D1B2A),
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            Image.asset('assets/images/b.png', height: 40),
            const SizedBox(width: 10),
            const Text(
              "Keen Job",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Agreement',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D1B2A),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                const Text(
                  'Please read and agree to all contracts before proceeding.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    'By proceeding, I acknowledge that I have read, understood, and agreed to the terms outlined by Keen Platform. As a beneficiary of this job-matching service, I willingly commit to contributing 20% of my first salary to Keen Platform as a token of appreciation and to support the platform’s continued growth and service to job seekers. I understand that accepting this agreement is a step toward my professional journey, facilitated by Keen Platform’s support and opportunities.',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                padding: EdgeInsets.fromLTRB(90, 10, 90, 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white70,
                      // disabledBackgroundColor: Color(0xFF072850),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      upload_file();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_file, color: Color(0xFF072850)),
                        SizedBox(width: 8),
                        Text(
                          'Upload Sign',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                Container( //dropdown
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20), //3rd



                    // width: 350.0,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      // border: Border.all(color: Colors.black)
                    ),

                    child: DropdownButtonFormField(
                        hint: Text("Select the Application Id"),
                        onChanged: ( newValue) {
                          setState(() {
                            dropdownValue = newValue.toString();
                            print(dropdownValue);
                          });
                        },
                        items: dropList.map((item) => DropdownMenuItem(child: Text(item['application_id'].toString()),value:item['application_id'].toString(),)).toList()
                    )

                ),

                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _isAgreed,
                      onChanged: (bool? value) {
                        setState(() {
                          _isAgreed = value ?? false;
                        });
                      },
                    ),
                    const Text('I agree to all contracts'),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF0D1B2A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 32,
                      ),
                    ),
                    onPressed: _onSubmit,
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
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

void main() => runApp(const MaterialApp(home: agreement()));
