import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/demoget');
              },
              child: Text('Demo Get'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/demoputpatch');
            }, child: Text("Demoputpatch")
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/demodelete');
            }, child: Text("Demodelete")
            ),
          ],
        ),
      ),
    );
  }
}
