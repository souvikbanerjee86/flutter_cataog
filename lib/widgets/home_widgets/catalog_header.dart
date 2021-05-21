import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../theme.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.color(MyTheme.darkBluishColor).xl4.bold.make(),
        "Trending products".text.xl.make()
      ],
    );
  }
}
