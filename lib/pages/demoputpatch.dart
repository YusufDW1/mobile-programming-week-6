import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Demoputpatch extends StatefulWidget {
  const Demoputpatch({super.key});

  @override
  State<Demoputpatch> createState() => _DemogetState();
}

class _DemogetState extends State<Demoputpatch> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController userC = TextEditingController();
  final TextEditingController emailC = TextEditingController();

  String hasil = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo Put | Patch")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: userC,
            decoration: InputDecoration(
              labelText: "Username",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: emailC,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              var myrespon = await http.put(
                Uri.parse("https://jsonplaceholder.typicode.com/users/1"),
                body: {
                  "name": nameC.text,
                  "username": userC.text,
                  "email": emailC.text,
                },
              );
              setState(() {
                if (myrespon.statusCode == 200) {
                  hasil = myrespon.body;
                } else {
                  hasil = "Error";
                }
              });
              print(myrespon.statusCode);
              print(myrespon.body);
            },
            child: Text("kirim PUT"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              var myrespon = await http.patch(
                Uri.parse("https://jsonplaceholder.typicode.com/users/1"),
                body: {
                  "name": nameC.text,
                  "username": userC.text,
                  "email": emailC.text,
                },
              );
              setState(() {
                if (myrespon.statusCode == 200) {
                  hasil = myrespon.body;
                } else {
                  hasil = "Error";
                }
              });
              print(myrespon.statusCode);
              print(myrespon.body);
            },
            child: Text("kirim Patch"),
          ),
          SizedBox(height: 20),
          Text(hasil),
        ],
      ),
    );
  }
}
