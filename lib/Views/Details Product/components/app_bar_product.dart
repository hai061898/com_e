import 'package:e_com/Bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarProduct extends StatelessWidget {
 
  final String? nameProduct;
  final String? uidProduct;

  const AppBarProduct({Key? key, this.nameProduct, this.uidProduct }):super(key: key);

  @override
  Widget build(BuildContext context) {

    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child:const  CircleAvatar(
            backgroundColor: Color(0xffF3F4F6),
            radius: 24,
            child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black ),
          ),
        ),
        SizedBox(
          width: 250,
          child: Text(nameProduct!, overflow: TextOverflow.ellipsis, style: GoogleFonts.getFont('Roboto', fontSize: 19, color: Colors.grey))
        ),
        CircleAvatar(
          backgroundColor: const Color(0xffF3F4F6),
          radius: 24,
          child: IconButton(
            icon:const Icon(Icons.favorite_border_rounded, color: Colors.black ),
            onPressed: () => productBloc.add( AddOrDeleteProductFavorite(uidProduct: uidProduct)),
          ),
        ),
      ],
    );
  }
}