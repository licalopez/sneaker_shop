import 'package:flutter/material.dart';
import 'package:sneakers_shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  double _cartSubtotal = 0;
  List<Shoe> userCart = [];

  double get cartSubtotal => _cartSubtotal;
  List<Shoe> get cart => userCart;

  void addToCart(Shoe shoe) {
    userCart.add(shoe);
    _cartSubtotal += shoe.price;
    notifyListeners();
  }

  void removeFromCart(Shoe shoe) {
    userCart.remove(shoe);
    _cartSubtotal -= shoe.price;
    notifyListeners();
  }
}