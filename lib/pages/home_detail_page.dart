import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key key, this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          buttonPadding: const EdgeInsets.all(0),
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "£${catalog.price}".text.bold.xl3.red800.make(),
            AddToCart(catalog: catalog).wh(120, 40)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog.name.text
                          .color(context.accentColor)
                          .xl4
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "Et dolor amet diam kasd invidunt. At lorem ipsum diam clita accusam ipsum labore, consetetur amet elitr amet ea nonumy takimata kasd sit dolores. Magna eos lorem diam consetetur duo. Sit erat dolor voluptua invidunt voluptua et gubergren sit et, sed erat erat eirmod sed diam ipsum ipsum aliquyam, ea."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p8()
                    ],
                  ).py32(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
