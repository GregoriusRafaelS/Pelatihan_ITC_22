import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'homes_screen.dart';

class loginScreen extends StatefulWidget {
  loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passController;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController;
    _passController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TUGAS 2"),
      ),
      body: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                     width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                     width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)),
                ),
              ),
            ),

            const SizedBox(height: 20,),
          
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                     width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                     width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10)),
                ),
              ),
            ),

            const SizedBox(height: 20,),

            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue
              ),
              onPressed: (() async{
                try{
                  await _firebaseAuth.signInWithEmailAndPassword(
                  email: _emailController.text, 
                  password: _passController.text
                  ).then((value) => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => homesScreen())
                  ));
                }catch(e){
                  print(e);
                }
              }), 
              child: const Text(
                "Login Button",
                style: TextStyle(
                  fontSize: 20
                ))),

            const SizedBox(height: 20,),
          
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue
              ),
              onPressed: (() async{
                if(_passController.text.length >= 6){
                  await _firebaseAuth.createUserWithEmailAndPassword(
                    email: _emailController.text, 
                    password: _passController.text);
                }}), 
              child: const Text("Register Button",
              style: TextStyle(
                  fontSize: 20
              ))),
          
          ],
        ),
      );
  }
}