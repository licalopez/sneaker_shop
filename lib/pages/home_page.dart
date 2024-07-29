import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/components/bottom_nav_bar.dart';
import 'package:sneakers_shop/components/custom_drawer.dart';
import 'package:sneakers_shop/models/nav_bar_controls.dart';
import 'package:sneakers_shop/models/theme.dart';
import 'package:sneakers_shop/pages/cart_page.dart';
import 'package:sneakers_shop/pages/shop_page.dart';
import 'package:sneakers_shop/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    ThemeData currentTheme = Provider.of<ThemeProvider>(context).currentTheme;
    void Function() toggleTheme = Provider.of<ThemeProvider>(context).toggleTheme;


    return Consumer<NavBarControls>(
      builder: (context, value, child) {
        final navBarControls = context.read<NavBarControls>();

        List<Widget> pages = <Widget>[
          const ShopPage(),
          const CartPage(),
        ];

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: theme.onSurfaceVariant,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  padding: const EdgeInsets.only(left: 5),
                );
              }
            ),
        
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: AnimatedSwitcher(
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  duration: const Duration(milliseconds: 200),
                  child: currentTheme == lightMode
                    ? IconButton(
                      key: const ValueKey<int>(0),
                      onPressed: () => toggleTheme(),
                      icon: const Icon(Icons.wb_sunny_outlined),
                    )
                    : IconButton(
                      key: const ValueKey<int>(1),
                      onPressed: () => toggleTheme(),
                      icon: const Icon(Icons.mode_night_outlined),
                    )
                ),
              ),
            ],
        
            // Status Bar colour theme
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: currentTheme == lightMode   // Android - dark text on light mode
                ? Brightness.dark : Brightness.light,
              statusBarBrightness: currentTheme == lightMode       // iOS - dark text on light mode
                ? Brightness.light : Brightness.dark,  
            ),
          ),
        
          backgroundColor: theme.surface,
        
          bottomNavigationBar: CustomBottomNavBar(
            onTabChange: (int index) => navBarControls.setCurrentIndex(index),
            selectedIndex: value.currentIndex,
          ),
          
          body: pages.elementAt(value.currentIndex),
          drawer: const CustomDrawer(),
        );
      }
    );
  }
}