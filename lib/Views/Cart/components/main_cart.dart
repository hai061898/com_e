import 'package:e_com/Bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'appbar_cart.dart';
import 'card_product.dart';
import 'isempty_cart.dart';

class ListProductsCard extends StatelessWidget {
  const ListProductsCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) 
  {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 15.0),
          const AppBarCart(),
          const SizedBox(height: 20.0),
          productBloc.product.isEmpty ?const WithoutProducts() :const DetailsProducts()
        ],
      ),
    );
  }
}