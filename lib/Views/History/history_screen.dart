import 'package:e_com/Data/Models/Response/purchased_products.dart';
import 'package:e_com/Repositories/product_repositories.dart';
import 'package:e_com/Widgets/shimer_frave.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';

import 'components/details_product_buy.dart';

class ShoppingPage extends StatelessWidget
{
  const ShoppingPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const TextFrave(text: 'Purchased', color: Colors.black ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black ),
          onPressed: () => Navigator.of(context).pop(), // .pop() là lùi về trang trước đó
        ),
      ),
      body: FutureBuilder<PurchasedProductsResponse>(
        future: productRepositorie.getPurchasedProducts(),
        builder: (_, snapshot) {
          return ( !snapshot.hasData )
           ? const ShimmerFrave()
           : DetailsProductsBuy(purchased: snapshot.data );
            
        } ,
      ),
     );
  }
}