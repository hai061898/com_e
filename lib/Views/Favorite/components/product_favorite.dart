import 'package:e_com/Data/Models/Product/favorite_product.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';

class ProductFavorite extends StatelessWidget {
  final Favorite? product;

  const ProductFavorite({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: [
            Image.network('http://127.0.0.1/' + product!.picture, height: 140),
            TextFrave(
                text: product!.nameProduct,
                fontSize: 17,
                textOverflow: TextOverflow.ellipsis),
            const SizedBox(height: 10.0),
            TextFrave(
                text: '\$ ${product!.price}',
                fontSize: 21,
                fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
}
