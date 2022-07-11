import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tugas2_auth_app/page/login_screen.dart';
import 'package:http/http.dart' as http;
import '../routes/routes.dart';
import '../modal/user.dart';


class homesScreen extends StatefulWidget {
  homesScreen({Key? key}) : super(key: key);

  @override
  State<homesScreen> createState() => _homesScreenState();
}

class _homesScreenState extends State<homesScreen> {
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

  Future <void> _signOut() async{
    await FirebaseAuth.instance.signOut();
  }
  
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if(auth.currentUser != null){
      print(auth.currentUser!.email);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(auth.currentUser!.email.toString()),
      ),
      body: FutureBuilder(
            future: _getData(),
            builder: ((context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }else{
                return SingleChildScrollView(
                  child: Column(
                    children: [ 
                      ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
                    ),

                    const SizedBox(height: 20,),

                    ElevatedButton(onPressed: (){
                            _signOut().then((value) => Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context)=>loginScreen())));
                          },
                           child: const Text("LOG OUT")),
                
                          const SizedBox(height: 20,),
                    ]
                  ),
                );
              }
              
            })),
    );
  }
}