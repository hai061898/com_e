import 'package:e_com/Bloc/product/product_bloc.dart';
import 'package:e_com/Views/Checkout/check_out.dart';
import 'package:e_com/Widgets/animation_router.dart';
import 'package:e_com/Widgets/btn_frave.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/main_cart.dart';

class CartPage extends StatelessWidget
{
  const CartPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    final size = MediaQuery.of(context).size;
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

         const ListProductsCard(),

          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              height: 133,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 10, spreadRadius: 5)]
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextFrave(text: 'Total', fontSize: 23, fontWeight: FontWeight.w600 ),
                        BlocBuilder<ProductBloc, ProductState>(
                          builder: (context, state) 
                            => TextFrave(text: '\$ ${state.total.toStringAsFixed(2) }', fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xff0C6CF2)),
                        )
                        
                      ],
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  BtnFrave(
                    text: 'Checkout', 
                    borderRadius: 50, 
                    fontSize: 22, 
                    height: 56,
                    onPressed: (){
                      if( productBloc.product.isNotEmpty ) {
                        Navigator.of(context).push(rutaFrave(page:const  CheckOutPagePage(), curved: Curves.easeInOut));
                      }
                    },
                  ),
                ],
              ),
            ),
          )

        ],
      ),
     );
  }
}