import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class HomePageGet extends StatefulWidget {
  HomePageGet({Key? key}) : super(key: key);

  @override
  State<HomePageGet> createState() => _HomePageGetState();
}

class _HomePageGetState extends State<HomePageGet> {
  late String email;
  late String name;
  late String id;

  @override
  void initState() {
    email = "Belum Ada Data";
    name = "";
    id = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP GET"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(id),
            Text(name),
            Text(email),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: ()async{
                var response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
                var data = jsonDecode(response.body) as Map<String, dynamic>;

                if(response.statusCode == 200){
                  // berhasil
                  print("Berhasil");
                  setState(() {
                    // name = data['data']['first_name'] + " " + data['data']['last_name'];
                    email = data['data']['email'];
                    name = "${data['data']['first_name']} ${data['data']['last_name']}";
                    id = data['data']['id'].toString();
                  });
                }else{
                  // gagal
                  print("Gagal");
                }
              }, child: Text("Get Data"))
          ],
        ),
      ),
    );
  }
}