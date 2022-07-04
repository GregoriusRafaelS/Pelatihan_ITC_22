import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as  http;

class HomePagePost extends StatefulWidget {
  HomePagePost({Key? key}) : super(key: key);

  @override
  State<HomePagePost> createState() => _HomePagePostState();
}

class _HomePagePostState extends State<HomePagePost> {
  late String value;
  late TextEditingController nameControler = TextEditingController();
  late TextEditingController jobControler = TextEditingController();

  @override
  void initState() {
    value = "Belum Ada Data";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP POST"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameControler,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name"
            ),
          ),

          SizedBox(height: 20),

          TextField(
            controller: jobControler,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job",
            ),
          ), 

          SizedBox(height: 20,),

          ElevatedButton(
            onPressed: ()async{
              var response = await http.post(Uri.parse('https://reqres.in/api/users'),
                body: {"name": nameControler.text, "job": jobControler.text });

              var data = json.decode(response.body) as Map<String, dynamic>;

              print(response.statusCode);
              setState(() {
                value = "${data["name"]} --- ${data["job"]}";
              });
            },
            child: Text("Post")),

            SizedBox(height: 20,),

            Text(value),
        ],
      ),
    );
  }
}