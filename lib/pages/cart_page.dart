import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(color: context.accentColor),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
