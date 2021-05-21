import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key key, this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          buttonPadding: const EdgeInsets.all(0),
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "£${catalog.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(StadiumBorder()),
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor),
              ),
              onPressed: () {},
              child: "Add to cart".text.make(),
            ).wh(120, 40)
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
                  color: Colors.white,
                  child: Column(
                    children: [
                      catalog.name.text
                          .color(MyTheme.darkBluishColor)
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
