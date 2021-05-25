import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final String productData =
    //     await rootBundle.loadString("assets/files/catalog.json");

    final response = await http.get(Uri.parse(url));
    final String productData = response.body;
    final decoded = jsonDecode(productData);
    var product = decoded['products'];
    CatalogModel.items =
        List.from(product).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _) => FloatingActionButton(
          onPressed: () {
            //Navigator.pushNamed(context, MyRoutes.cartRoute);
            context.vxNav.push(Uri.parse(MyRoutes.cartRoute));
          },
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
          backgroundColor: context.theme.buttonColor,
        ).badge(
            color: Vx.red400,
            size: 22,
            count: _cart.items.length,
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py4().expand()
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
