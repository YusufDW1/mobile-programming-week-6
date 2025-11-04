import 'package:crud/pages/demodelete.dart';
import 'package:crud/pages/demoputpatch.dart';

import 'pages/HomePage.dart';
import 'pages/demoget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(crud());
}

class crud extends StatelessWidget {
  const crud({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Homepage(),
        '/demoget': (context) => Demoget(),
        '/demoputpatch': (context) => Demoputpatch(),
        '/demodelete': (context) => Demodelete(),
      },
    );
  }
}
