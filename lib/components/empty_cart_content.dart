import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/components/app_button.dart';
import 'package:sneakers_shop/models/nav_bar_controls.dart';

class EmptyCartContent extends StatelessWidget {
  const EmptyCartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarControls>(
      builder: (context, value, child) {
        final navBarControls = context.read<NavBarControls>();
        ColorScheme theme = Theme.of(context).colorScheme;

        return Column(
          children: [
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.onPrimary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: theme.onSurfaceVariant,
                  size: 42.0,
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.only(
                bottom: 25.0,
                top: 12.0,
              ),
              child: Text(
                'Your cart is empty',
                style: TextStyle(
                  color: theme.onSurfaceVariant,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        
            AppButton(
              onPressed: () => navBarControls.setCurrentIndex(0),
              text: 'Start shopping',
            )
          ],
        );
      },
    ) ;
  }
}