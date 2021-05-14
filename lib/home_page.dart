import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int days = 30;
  String name = "Souvik";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: Center(
        child: Container(
          child: Text('Welcome to $days days of Flutter $name'),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
