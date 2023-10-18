import 'package:flutter/material.dart';
import 'shop_model.dart';

class ShopProvider extends ChangeNotifier {
  List<Model> existingProducts = [
    Model(id: "1", name: "HP Laptop", price: "100k", quantity: "199 pieces"),
    Model(id: "1", name: "HP Laptop", price: "100k", quantity: "199 pieces"),
    Model(id: "1", name: "HP Laptop", price: "100k", quantity: "199 pieces"),
    Model(id: "1", name: "HP Laptop", price: "100k", quantity: "199 pieces"),
    Model(id: "1", name: "HP Laptop", price: "100k", quantity: "199 pieces")
  ];

  List<Model> cartProducts = [];

  void addProducts(Model model) {
    cartProducts.add(model);
    notifyListeners();
  }

  removeProducts(int index) {
    cartProducts.removeAt(index);
    notifyListeners();
  }
}
