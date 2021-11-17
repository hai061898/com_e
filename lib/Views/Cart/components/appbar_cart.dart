import 'package:e_com/Bloc/product/product_bloc.dart';
import 'package:e_com/Views/Home/home_screen.dart';
import 'package:e_com/Widgets/animation_router.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarCart extends StatelessWidget {
  const AppBarCart({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xffF5F5F5),
                radius: 24,
                child: InkWell(
                  onTap: () => Navigator.of(context).pushReplacement(rutaFrave(page:const HomePage(), curved: Curves.easeInOut)),
                  child: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black )
                ),
              ),
              const SizedBox(width: 20.0),
              const SizedBox(
                child: TextFrave(text: 'My Cart', fontSize: 24, fontWeight: FontWeight.w600 )
              ),
            ],
          ),
          
          SizedBox(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (_, state) => TextFrave(text: '${state.products!.length} items', fontSize: 19, color: Colors.black54 ),
            )
          ),
        ],
      ),
    );
  }
}