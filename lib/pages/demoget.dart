import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Demoget extends StatefulWidget {
  const Demoget({super.key});
 

  @override
  State<Demoget> createState() => _DemogetState();
}

class _DemogetState extends State<Demoget> {
  final TextEditingController nameC = TextEditingController();
  final TextEditingController userC = TextEditingController();
  final TextEditingController emailC = TextEditingController();

  String hasil = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demoget"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(controller: nameC, decoration: InputDecoration(
            labelText: "Name",
            border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 20),
          TextField(controller: userC, decoration: InputDecoration(
            labelText: "Username",
            border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 20),
          TextField(controller: emailC, decoration: InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () async {
            var myrespon = await
            http.post(
              Uri.parse("https://jsonplaceholder.typicode.com/users"),
              body: {
                "name": nameC.text,
                "username": userC.text,
                "email": emailC.text,
              },
            );
            setState(() {
              if (myrespon.statusCode == 201) {
                hasil = myrespon.body;
              } else {
                hasil = "Error";
              }
            });
            print(myrespon.statusCode);
            print(myrespon.body);
          }, child: Text("Kirim")
          ),
          SizedBox(height: 20),
          Text(hasil)
        ],
      ),
    );
  }
} 