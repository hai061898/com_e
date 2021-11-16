import 'package:e_com/Data/Models/Home/categories_products.dart';
import 'package:e_com/Repositories/home_repositories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'load_shimmer_categories.dart';

class ListCategories extends StatelessWidget {
  const ListCategories({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<Category>>(
        future: homeRepositories.getListCategoriesProducts(),
        builder: (context, snapshot) {
          
          List<Category>? list = snapshot.data;

          return !snapshot.hasData
          ?const LoadingShimmerCategories()
          : ListView.builder(
              physics:const  BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: list!.isEmpty ? 0 : list.length,
              itemBuilder: (context, i) => Container(
                margin:const EdgeInsets.only(right: 8.0),
                padding:const  EdgeInsets.symmetric(horizontal: 10.0),
                width: 150,
                decoration: BoxDecoration(
                  color:const  Color(0xff0C6CF2).withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Center(
                  child: Text( list[i].category , 
                    style: GoogleFonts.getFont('Roboto', fontSize: 18, color: const Color(0xff0C6CF2)),
                    overflow: TextOverflow.ellipsis,
                  )
                ),
              ),
            );

        },
      ),
    );
  }
}
