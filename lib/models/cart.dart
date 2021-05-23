import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  // catalog field
  CatalogModel _catalog;

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel catalogModel) {
    assert(catalogModel != null);
    _catalog = catalogModel;
  }

  final List<int> _itemIds = [];

  List<Item> get items =>
      _itemIds.map((id) => _catalog.getItemById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
