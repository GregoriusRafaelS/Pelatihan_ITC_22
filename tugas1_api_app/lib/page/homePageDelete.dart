import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageDelete extends StatefulWidget {
  HomePageDelete({Key? key}) : super(key: key);

  @override
  State<HomePageDelete> createState() => _HomePageDeleteState();
}

class _HomePageDeleteState extends State<HomePageDelete> {
  late String value;

  @override
  void initState() {
    value = "Belum Ada Data";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP DElETE"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value),
            ElevatedButton(
              onPressed: ()async{
                var response = await http.get(Uri.parse('https://reqres.in/api/users/2'));
                var data = jsonDecode(response.body) as Map<String, dynamic>;
                setState(() {
                  value = "${data['data']['first_name']} ${data['data']['last_name']}";
                });
              },
             child: Text("Get Data")),
            ElevatedButton(
              onPressed: ()async{
                var response = await http.delete(Uri.parse('https://reqres.in/api/users/2'));
                print(response.statusCode);
                setState(() {
                  value = "Berhasil Hapus Data";
                });
              },
             child: Text("Delete Data")),
          ],
        ),
      ),
    );
  }
}