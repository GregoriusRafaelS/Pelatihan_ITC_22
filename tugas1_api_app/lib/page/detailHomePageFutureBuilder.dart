import 'package:flutter/material.dart';

class DetailHomePageFuture extends StatefulWidget {
  var id, email, firstName, lastName, avatar;
  DetailHomePageFuture({Key? key, required this.id, required this.email, required this.firstName, required this.lastName, required this.avatar}) : super(key: key);

  @override
  State<DetailHomePageFuture> createState() => _DetailHomePageFutureState();
}

class _DetailHomePageFutureState extends State<DetailHomePageFuture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 207, 203, 190),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 125, 44),
        title: Text("Detail Account"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            width: 150,
            height: 150,
            child: FittedBox(
              fit: BoxFit.contain,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.avatar),
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.pinkAccent.withOpacity(0.80),
                width: 6,
              ),
            ),
          ),

          SizedBox(height: 30,),

          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color.fromARGB(255, 236, 232, 219),
            ),  
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Row(children: [Icon(Icons.person), SizedBox(width: 10,), Text("ID                  : ${widget.id}"),]),
                Row(children: [Icon(Icons.first_page), SizedBox(width: 10,), Text("First Name  : ${widget.firstName}"),]),
                Row(children: [Icon(Icons.last_page), SizedBox(width: 10,), Text("Last Name  : ${widget.lastName}"),]),
                Row(children: [Icon(Icons.email), SizedBox(width: 10,), Text("Email            : ${widget.email}"),]),    
              ]
          ),)
        ],
      ),
    );
  }
}