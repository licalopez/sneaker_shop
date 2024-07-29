import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/models/cart.dart';
import 'package:sneakers_shop/models/nav_bar_controls.dart';
import 'package:sneakers_shop/models/shop.dart';
import 'package:sneakers_shop/models/theme.dart';
import 'package:sneakers_shop/pages/home_page.dart';
import 'package:sneakers_shop/pages/intro_page.dart';

void main() {
  runApp(const ShoeShop());
}

class ShoeShop extends StatelessWidget {
  const ShoeShop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavBarControls(),
        ),
        ChangeNotifierProvider(
          create: (context) => Shop(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],

      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: const IntroPage(),
        initialRoute: '/',
        routes: {
          '/': (context) => const IntroPage(),
          '/home': (context) => const HomePage(),
        },
        title: 'Shoe Shop',
        theme: Provider.of<ThemeProvider>(context).currentTheme,
      ),
    );
  }
}
