import 'package:e_com/Data/Models/Product/favorite_product.dart';
import 'package:e_com/Repositories/product_repositories.dart';
import 'package:e_com/Widgets/bottom_custom.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';

import 'components/list_favorite.dart';
import 'components/loading_favorite.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const TextFrave(
          text: 'Favorites',
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xfff2f2f2),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          FutureBuilder<List<Favorite>>(
            future: productRepositorie.favoriteProducts(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const LoadingFavoriteProduct()
                  : ListFavoriteProduct(list: snapshot.data);
            },
          ),
          Positioned(
            bottom: 20,
            child: SizedBox(
                width: size.width,
                child: const Align(child: BottomNavigationFrave(index: 1))),
          ),
        ],
      ),
    );
  }
}
