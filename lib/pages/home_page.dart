import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final String productData =
        await rootBundle.loadString("assets/files/catalog.json");
    final decoded = jsonDecode(productData);
    var product = decoded['products'];
    CatalogModel.items =
        List.from(product).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                ).expand()
            ],
          ),
        ),
      ),
    );
  }
}

//--------------------------------OLD CODE --------------------------
//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Catalog App'),
//       ),
//       body: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//           ? ListView.builder(
//               itemCount: CatalogModel.items.length,
//               itemBuilder: (context, index) {
//                 return ItemWidget(item: CatalogModel.items[index]);
//               },
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//       drawer: MyDrawer(),
//     );
//   }
