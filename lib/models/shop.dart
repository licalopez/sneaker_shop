import 'package:flutter/material.dart';
import 'package:sneakers_shop/models/shoe.dart';

List<Shoe> shopData = [
  Shoe(
    name: 'Cloudhorizon',
    price: 210.00,
    description: 'Our most cushioned hiking shoe, built for max comfort and grip on moderate terrain. Get ready to disconnect and explore.',
    imagePath: 'lib/images/sneakers1.png'
  ),
  Shoe(
    name: 'Cloud X 3',
    price: 180.00,
    description: 'The ultra-agile shoe for mixed-sport workouts and all-day wear. With a breathable upper and impact-absorbing cushioning.',
    imagePath: 'lib/images/sneakers5.png'
  ),
  Shoe(
    name: 'Cloudmonster',
    price: 220.00,
    description: 'Max-cushioned running shoes meet monster-level bounce and energy return. For a fun, forward-rolling ride.',
    imagePath: 'lib/images/sneakers2.png'
  ),
  Shoe(
    name: 'Cloudstratus',
    price: 190.00,
    description: 'A cushioned, forward-rolling road shoe with dual-density Helion superfoam and a zonal knit upper for an inclusive fit.',
    imagePath: 'lib/images/sneakers3.png'
  ),
  Shoe(
    name: 'Cloudtilt',
    price: 200.00,
    description: 'Your lightweight, ultra-cushioned hero. Precision-engineered for lasting comfort during all-day city adventures.',
    imagePath: 'lib/images/sneakers4.png'
  ),
  Shoe(
    name: 'Cloudboom',
    price: 360.00,
    description: 'Built for marathons. Race-day ready. This road runner is ultra-responsive, ultra-cushioned and part of the Prism Capsule Collection.',
    imagePath: 'lib/images/sneakers6.png'
  ),
  Shoe(
    name: 'Cloudstratus 2',
    price: 230.00,
    description: 'The bestseller, bettered. Now with even more comfort, cushioning and sustainability. Double CloudTec®. Double your run.',
    imagePath: 'lib/images/sneakers7.png'
  ),
];

class Shop extends ChangeNotifier {
  final List<Shoe> _shop = [...shopData];
  List<Shoe> _shopByQuery = [...shopData];

  List<Shoe> get shopByQuery => _shopByQuery;


  void setSearchStringByQuery(String query) {
    _shopByQuery = _getShopByQuery(query);
    notifyListeners();
  }

  List<Shoe> _getShopByQuery(String query) {
    List<Shoe> filteredShoes = [];

    for (var i = 0; i < _shop.length; i++) {
      if (_shop[i].name.contains(query) || _shop[i].description.contains(query)) {
        filteredShoes.add(_shop[i]);
      }
    }

    return filteredShoes;
  }
}