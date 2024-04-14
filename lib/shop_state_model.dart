import 'package:flutter/material.dart';
import 'dart:math';

class ShopStateModel extends ChangeNotifier {
  var random = Random();
  List selectedItems = [];
  List selectedItemsPrice = [];
  List clientsCreatedOrders = [];
  double sum = 0;
  String sumDisplay = "0.000";

  void addItem(index, double value) {
    selectedItems.add(index);
    selectedItemsPrice.add(value);
    sum = sum + value;
    sumDisplay = sum.toStringAsFixed(3);
    notifyListeners();
  }

  void deleteItem(index) {
    selectedItems.removeAt(index);
    sum = sum - selectedItemsPrice[index];
    selectedItemsPrice.removeAt(index);
    sumDisplay = sum.toStringAsFixed(3);
    notifyListeners();
  }

  clearCart() {
    selectedItems.clear();
    selectedItemsPrice.clear();
    int orderID = random.nextInt(10000);
    sum = 0;
    sumDisplay = '0.000';
    clientsCreatedOrders.add(orderID);
    notifyListeners();
  }

  int getOrderID() {
    return clientsCreatedOrders[clientsCreatedOrders.length - 1];
  }
}
