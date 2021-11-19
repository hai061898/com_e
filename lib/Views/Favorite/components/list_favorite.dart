import 'package:e_com/Data/Models/Product/favorite_product.dart';
import 'package:e_com/Views/Favorite/components/product_favorite.dart';
import 'package:flutter/material.dart';

class ListFavoriteProduct extends StatelessWidget {
  final List<Favorite>? list;

  const ListFavoriteProduct({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 90),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 20,
            mainAxisExtent: 220),
        itemCount: list!.isEmpty ? 0 : list!.length,
        itemBuilder: (context, i) => ProductFavorite(product: list![i]));
  }
}
