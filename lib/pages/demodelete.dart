import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Demodelete extends StatefulWidget {
  const Demodelete({super.key});

  @override
  State<Demodelete> createState() => _DemodeleteState();
}

class _DemodeleteState extends State<Demodelete> {
  String hasil = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Delete"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () async {
              var myrespon = await http.delete(Uri.parse("https://jsonplaceholder.typicode.com/users/1"));
              print(myrespon.statusCode);
              print(myrespon.body);

              setState(() {
                if (myrespon.statusCode == 200) {
                  hasil = "Berhasil menghapus ID 1";
                } else {
                  hasil = "Gagal menghapus ID 1";
                }
              });
            }, child: Text("Hapus")
            ),
            Text(hasil)
          ],
        ),
      ),
    );
  }
}