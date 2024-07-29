import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/components/app_button.dart';
import 'package:sneakers_shop/components/cart_item.dart';
import 'package:sneakers_shop/components/empty_cart_content.dart';
import 'package:sneakers_shop/helpers/index.dart';
import 'package:sneakers_shop/models/cart.dart';
import 'package:sneakers_shop/models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    return Consumer<Cart>(builder: (context, value, child) {
      List<Shoe> shoes = value.cart;

      // Count how many occurences of a shoe item is in the cart
      var counts = shoes.fold<Map<String, int>>({}, (map, shoe) {
        map[shoe.name] = (map[shoe.name] ?? 0) + 1;
        return map;
      });

      // Remove duplicates from `shoes` list so there are no duplicate CartItems
      var uniqueShoes = shoes.toSet().toList();

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Text(
              'My Cart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 15),

            shoes.isEmpty 
              ? const EmptyCartContent()
              : Expanded(
                child: ListView.builder(
                  itemCount: uniqueShoes.length,
                  itemBuilder: (context, index) {
                    Shoe shoe = uniqueShoes[index];
                    return CartItem(shoe: shoe, itemCount: counts[shoe.name]!);
                  },
                ),
              ),

            // Spacer if cart is empty to keep Subtotal Container at bottom of screen
            shoes.isEmpty ? const Spacer() : const SizedBox(),

            // Subtotal Container
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                          color: theme.onPrimary,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              
                      Text(
                        '\$${addCommaToNumString(value.cartSubtotal)}',
                        style: TextStyle(
                          color: theme.onSurfaceVariant,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),

                  AppButton(
                    onPressed: shoes.isEmpty ? null : () => print('checkout'),
                    text: 'Checkout'.toUpperCase()
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}