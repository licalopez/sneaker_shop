import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/models/nav_bar_controls.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    return Consumer<NavBarControls>(
      builder: (context, value, child) {
        final navBarControls = context.read<NavBarControls>();

        return Drawer(
          backgroundColor: theme.onSurface,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                child: Image.asset(
                  'lib/images/on-logo.png',
                  color: theme.primary,
                  cacheHeight: 100,
                  height: 100,
                ),
              ),
            
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  navBarControls.setCurrentIndex(0);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 15.0,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.storefront_rounded, 
                      color: theme.primary
                    ),
                    title: Text(
                      'Shop', 
                      style: TextStyle(
                        color: theme.primary,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w500,
                      )
                    ),
                  ),
                ),
              ),
            
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  navBarControls.setCurrentIndex(1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.shopping_bag_rounded, color: theme.primary),
                    title: Text(
                      'Cart', 
                      style: TextStyle(
                        color: theme.primary,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w500,
                      )
                    ),
                  ),
                ),
              ),
              const Spacer(),
        
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/'),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 50.0,
                    left: 25.0,
                    right: 25.0,
                  ),
                  child: ListTile(
                    leading: Icon(Icons.logout, color: theme.primary),
                    title: Text(
                      'Exit', 
                      style: TextStyle(
                        color: theme.primary,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w500,
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}