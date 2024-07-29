import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/components/app_button.dart';
import 'package:sneakers_shop/helpers/index.dart';
import 'package:sneakers_shop/models/cart.dart';
import 'package:sneakers_shop/models/nav_bar_controls.dart';
import 'package:sneakers_shop/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  final int index;
  final Shoe shoe;

  final double _containerRadius = 30.0;
  final double _contentPadding = 18.0;

  const ShoeTile({
    super.key,
    required this.index,
    required this.shoe,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    void addShoeToCart(Shoe shoe, VoidCallback goToCart) {
      Provider.of<Cart>(context, listen: false).addToCart(shoe);

      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: const Text('Success!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    const TextSpan(text: '"'),
                    TextSpan(
                      // ignore: unnecessary_string_interpolations
                      text: '${shoe.name}', 
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const TextSpan(text: '" has been added to your cart.'),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              AppButton(
                onPressed: () {
                  Navigator.pop(context);
                  goToCart();
                }, 
                size: Sizes.small,
                text: 'View Cart',
              ),
            ],
          )
        ),
      );
    }

    return Consumer2<Cart, NavBarControls>(
      builder: (context, cartValue, navBarControlsValue, child) {
        final navBarControls = context.read<NavBarControls>();

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_containerRadius),
            color: theme.primary,
          ),
          margin: EdgeInsets.only(
            left: index == 0 ? 20 : 0,
            right: 20
          ),
          padding: EdgeInsets.only(
            top: _contentPadding,
          ),
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _contentPadding),
                child: Image.asset(shoe.imagePath),
              ),
        
              // Description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _contentPadding),
                child: Text(
                  shoe.description,
                  style: TextStyle(
                    color: theme.onPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
        
              // Price
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _contentPadding,
                      vertical: 18.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shoe.name,
                          style: TextStyle(
                            color: theme.onSurface,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '\$${addCommaToNumString(shoe.price)}',
                          style: TextStyle(
                            color: theme.onPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
        
                  // "Add to Cart" btn
                  GestureDetector(
                    onTap: () => addShoeToCart(shoe, () => navBarControls.setCurrentIndex(1)),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(_containerRadius),
                          topLeft: Radius.circular(_containerRadius),
                        ),
                        color: theme.onSurface,
                      ),
                      padding: const EdgeInsets.all(22),
                      child: Icon(
                        Icons.add,
                        color: theme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}