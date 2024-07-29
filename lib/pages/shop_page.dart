import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_shop/components/search_bar.dart';
import 'package:sneakers_shop/components/shoe_tile.dart';
import 'package:sneakers_shop/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;

    return Consumer<Shop>(
      builder: (context, value, child) {
        return Column(
        children: [
          const AppSearchBar(),
      
          // Trending Heading
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15.0,
              left: 20.0,
              right: 20.0,
              top: 25.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today\'s Hot Picks',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.0,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: theme.onSurface.withAlpha(130),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
      
          // Trending Content
          Expanded(
            child: ListView.builder(
              itemCount: value.shopByQuery.length,
              itemBuilder: (context, index) {
                return ShoeTile(
                  index: index,
                  shoe: value.shopByQuery[index]
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
      
          // Negative space below Shoe Tile
          const Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Divider(
              color: Colors.transparent,
            ),
          ),
        ],
      );
      } 
    );
  }
}