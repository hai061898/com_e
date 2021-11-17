import 'package:e_com/Bloc/product/product_bloc.dart';
import 'package:e_com/Data/Models/Home/products_home.dart';
import 'package:e_com/Data/Models/products_cart.dart';
import 'package:e_com/Helpers/model_add_cart.dart';
import 'package:e_com/Views/Home/home_screen.dart';
import 'package:e_com/Widgets/animation_router.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/app_bar_product.dart';
import 'components/images_product.dart';
import 'components/rating_star.dart';

class DetailsProductPage extends StatelessWidget
{
  final Product product;

  const DetailsProductPage({Key? key, required this.product }):super(key: key); 

  @override
  Widget build(BuildContext context)
  {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(top: 10.0, bottom: 100.0),
              children: [
                AppBarProduct(nameProduct: product.nameProduct, uidProduct: product.uidProduct.toString() ),
                const SizedBox(height: 20.0),
                ImageProduct( uidProduct: product.uidProduct.toString(), imageProduct: product.picture),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    children: [
                      TextFrave(text: product.nameProduct, fontSize: 25,)
                    ],
                  ),
                ),

                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFrave(text: '\$ ${product.price}', fontSize: 30, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10.0),
                const RaitingProduct(),

                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        SvgPicture.asset('Assets/garantia.svg', color: Colors.green, height: 50),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: 'This product has a ', style: GoogleFonts.getFont('Roboto', color: Colors.black, fontSize: 18)),
                              TextSpan(text: 'delivery guarantee', style: GoogleFonts.getFont('Roboto', color: Colors.blue, fontSize: 18))
                            ]
                          ),
                        )
                      ],
                    )
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 240.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                    color: const Color(0xff8956FF),
                    child: const TextFrave(text: 'Shipping normally', fontSize: 18, color: Colors.white ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    child: Row(
                      children: const [
                        TextFrave(text: 'Available. ', fontSize: 18, color: Colors.green ),
                        TextFrave(text: 'In Stock', fontSize: 18, ),
                      ],
                    ),
                  ),
                ), 

                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFrave(text: 'Description', fontSize: 20, fontWeight: FontWeight.bold ),
                ),

                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    children: [
                      TextFrave(text: product.description, fontSize: 17)
                    ],
                  ),
                ),

                const SizedBox(height: 30.0 ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFrave(text: 'Payment methods', fontSize: 20, fontWeight: FontWeight.bold ),
                ),
                Container(
                  height: 60,
                  color: const Color(0xfff5f5f5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset('Assets/visa.svg', height: 60, color: Colors.blue,),
                      SvgPicture.asset('Assets/mastercard.svg', height: 60,),
                      SvgPicture.asset('Assets/american express.svg', height: 60,),
                      SvgPicture.asset('Assets/paypal.svg', height: 55 ),
                    ],
                  ),
                )
                
              ],
            ),

            Positioned(
              bottom: 0,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 15, spreadRadius: 5)
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
                        ),
                        child: const TextFrave(text: 'Add To Cart', fontSize: 20),
                        onPressed: () async {

                          modalAddCartSuccess(context, product.picture );

                          final productSelect = ProductCart(
                              uidProduct: product.uidProduct.toString(), 
                              image: product.picture, 
                              name: product.nameProduct, 
                              price: product.price.toDouble(),
                              amount: 1
                          );

                          productBloc.add( AddProductToCart( product: productSelect ));
                          await Future.delayed(const Duration(seconds: 2));
                          Navigator.pop(context);
                          Navigator.of(context).push(rutaFrave(page:const HomePage(), curved: Curves.easeInOut));
                        },
                      ),
                    ),
                    // SizedBox(width: 15.0),
                    Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: const Color(0xff2D55DB),
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
                        ),
                        child: const TextFrave(text: 'Buy Now', fontSize: 20, color: Colors.white ),
                        onPressed: (){

                          final productSelect = ProductCart(
                              uidProduct: product.uidProduct.toString(), 
                              image: product.picture, 
                              name: product.nameProduct, 
                              price: product.price.toDouble(),
                              amount: 1
                          );

                          productBloc.add( AddProductToCart( product: productSelect ));
                          
                          Navigator.of(context).push(rutaFrave(page: CartPage(), curved: Curves.easeInOut));

                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
     );
  }
}
