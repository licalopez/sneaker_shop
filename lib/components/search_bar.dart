import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/models/shop.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    Shop searchProvider = Provider.of<Shop>(context, listen: false);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              style: BorderStyle.none,
              width: 0,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          filled: true,
          fillColor: theme.primary,
          hintText: 'Search...',
          suffixIcon: Icon(
            Icons.search,
            color: theme.onPrimary,
          ),
        ),
        onChanged: (value) => searchProvider.setSearchStringByQuery(value),
      ),
    );
  }
}