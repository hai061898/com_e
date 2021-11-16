import 'package:e_com/Data/Models/Home/products_home.dart';
import 'package:e_com/Repositories/home_repositories.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'load_shimmer_product.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: homeRepositories.getListProductsHome(), // get product 
      builder: (context, snapshot) {
        
        List<Product>? list = snapshot.data; // lấy data trong lish 
        return !snapshot.hasData // nếu khác vc đang có data trả về 
        ? const LoadingShimmerProducts() // loading data
        : GridView.builder(
            physics:const  NeverScrollableScrollPhysics(),
            shrinkWrap: true,// trả khung hình vừa khích với nội dung 
            gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 20,
              mainAxisExtent: 220
            ),//hiển thị data dưới dạng gridview
            itemCount: list!.isEmpty ? 0 : list.length,
            itemBuilder: (context, i) => Container(
              //i là phần tử trong list
              padding:const  EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsProductPage(product: list[i]))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Hero(
                        tag: list[i].uidProduct.toString(),
                        child: Image.network('http://127.0.0.1/'+ list[i].picture, height: 150,)
                      ),
                    ),
                    Text(
                      list[i].nameProduct,
                      style: GoogleFonts.getFont('Roboto', fontSize: 17, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                    TextFrave(text: '\$ ${list[i].price}', fontSize: 16 ),
                  ],
                ),
              ),
            ),
          );

      },
    );
  }
}