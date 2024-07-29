import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/models/cart.dart';
import 'package:sneakers_shop/models/shoe.dart';
import '../helpers/index.dart';

class CartItem extends StatefulWidget {
  int itemCount;
  Shoe shoe;

  CartItem({
    super.key,
    required this.itemCount,
    required this.shoe,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> { 
  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    void addToCart() {
      Provider
        .of<Cart>(context, listen: false)
        .addToCart(widget.shoe);
    }

    void removeFromCart() {
      Provider
        .of<Cart>(context, listen: false)
        .removeFromCart(widget.shoe);
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: theme.primary,
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        contentPadding: const EdgeInsets.only(
          left: 16,
          right: 8,
        ),
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(
          widget.shoe.name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text('\$${addCommaToNumString(widget.shoe.price * widget.itemCount)}'),
        trailing: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Minus icon
            GestureDetector(
              onTap: removeFromCart,
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 28,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.minimize_rounded, 
                    color: theme.onSurface,
                    size: 18, 
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: theme.onSurface,
              ),
              height: 25,
              width: 25,
              padding: const EdgeInsets.all(4.0),
              child: Center(
                child: Text(
                  widget.itemCount.toString(),
                  style: TextStyle(
                    color: theme.secondary,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),

            // Plus icon
            GestureDetector(
              onTap: addToCart,
              child: Icon(
                Icons.add_rounded, 
                color: theme.onSurface,
                size: 18, 
              ),
            )
          ],
        ),
        // trailing: IconButton(
        //   icon: const Icon(Icons.delete_outline_rounded, size: 23.0,),
        //   onPressed: removeFromCart,
        // ),
      ),
    );
  }
}