import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../modal/users.dart';

class HomePageFuture extends StatefulWidget {
  HomePageFuture({Key? key}) : super(key: key);

  @override
  State<HomePageFuture> createState() => _HomePageFutureState();
}

class _HomePageFutureState extends State<HomePageFuture> {
  List<Users> allData = [];
  Future _getData()async{
    try{
      var response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
      if(response.statusCode == 200){
        List data = (jsonDecode(response.body) as Map<String, dynamic>)['data'];

        data.forEach((element) {
          allData.add(Users.fromJson(element));
        });

      }else{
        print("Gagal");
      }
    }catch(e){}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Tugas 1"),
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else{
            return ListView.builder(
              itemCount: allData.length,
              itemBuilder: (BuildContext context, int index) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.amber
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/detailAcc', arguments: Users(id: allData[index].id, email: allData[index].email, firstName: allData[index].firstName, lastName: allData[index].lastName, avatar: allData[index].avatar));
                },
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(allData[index].avatar),),
                    title: Text("${allData[index].firstName} ${allData[index].lastName}"),
                    subtitle: Text(allData[index].email),
                  ),
              )
            );
          }
        }))
      );
  }
}