import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/theme.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
