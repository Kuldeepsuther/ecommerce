import 'package:flutter/foundation.dart';
import 'package:shoppingcart/data/item.dart';

class AddToCart with ChangeNotifier {
  double totalPrice = 0;
  double itemPrice = 0;
  List<Item> selectedItems = [];
  List<Item> items = Item.items;
  List<Item> allOrders = [];
  void addItem(Item val) {
    if (selectedItems.contains(val)) {
      val.quantity += 1;
    } else {
      selectedItems.add(val);
    }
    totalPrice = calculatePrice();
    notifyListeners();
  }

  void removeItem(Item val) {
    if (selectedItems.contains(val) && val.quantity > 1) {
      val.quantity -= 1;
    } else {
      selectedItems.remove(val);
    }
    totalPrice = calculatePrice();
    notifyListeners();
  }

  double calculatePrice() {
    double totalPrice = 0;
    for (int i = 0; i < selectedItems.length; i++) {
      totalPrice += selectedItems[i].pricing * selectedItems[i].quantity;
    }
    return totalPrice;
  }
}
