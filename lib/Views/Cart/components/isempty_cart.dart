import 'package:e_com/Bloc/product/product_bloc.dart';
import 'package:e_com/Views/Home/home_screen.dart';
import 'package:e_com/Widgets/animation_router.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithoutProducts extends StatelessWidget {
  const WithoutProducts({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) 
  {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (_, state) 
        => (state.products!.isEmpty ) 
           ? SizedBox(
              height: 270,
              child: Column(
                  children: [
                  Icon(Icons.shopping_bag_outlined, size: 90, color: const Color(0xff0C6CF2).withOpacity(.7)),
                  const SizedBox(height: 20),
                  const TextFrave(text: 'There is a cart to fill!', fontSize: 18 ),
                  const SizedBox(height: 20),
                  const TextFrave(text: 'Currently do not have any products in your shopping cart', fontSize: 16 ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextButton(
                      style:ButtonStyle(
                        side: MaterialStateProperty.all( const BorderSide(color: Colors.blue) ),
                        padding: MaterialStateProperty.all( const EdgeInsets.symmetric(horizontal: 40, vertical: 10))
                      ),
                      child: const TextFrave(text: 'Go Products', fontSize: 19 ),
                      onPressed: () => Navigator.of(context).pushReplacement(rutaFrave(page: const HomePage(), curved: Curves.easeInOut)),
                    ),
                  )
                ],
              ),
      )
      :const SizedBox(),
    );
  }


}
