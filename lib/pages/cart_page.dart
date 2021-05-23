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
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "£9999".text.xl2.color(context.accentColor).make(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: "This feature is not available yet!".text.make(),
                  ),
                );
              },
              child: "Buy".text.make(),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                context.theme.buttonColor,
              )),
            ).w32(context)
          ],
        ).p32(),
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.done),
            title: "Item 1".text.make(),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {},
            ),
          );
        });
  }
}
