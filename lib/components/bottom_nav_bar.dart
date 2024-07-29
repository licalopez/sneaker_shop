import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  void Function(int) onTabChange;
  int selectedIndex;

  CustomBottomNavBar({
    super.key,
    required this.onTabChange,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: GNav(
        selectedIndex: selectedIndex,
        activeColor: theme.onSurfaceVariant,
        color: theme.onSurface.withAlpha(75),
        mainAxisAlignment: MainAxisAlignment.center,
        onTabChange: (value) => onTabChange(value),
        tabs: const [
          GButton(icon: Icons.storefront_rounded, text: 'Shop', gap: 6,),
          GButton(icon: Icons.shopping_bag_rounded, text: 'Cart', gap: 6),
        ],
        tabActiveBorder: Border.all(
          color: theme.surface,
        ),
        tabBackgroundColor: theme.secondary.withAlpha(100),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
      ),
    );
  }
}