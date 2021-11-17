import 'package:e_com/Data/Models/Home/categories_products.dart';
import 'package:e_com/Repositories/home_repositories.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';

import 'components/list_category.dart';

class CategoriesPage extends StatelessWidget
{
  const CategoriesPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios_rounded, color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        title:const TextFrave(text: 'Categories', color: Colors.black),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Category>>(
         future: homeRepositories.getListCategories(),
         builder: (context, snapshot){
            return !snapshot.hasData
            ? Center(
                child: Row(
                  children: const [
                    CircularProgressIndicator(),
                    TextFrave(text: 'Loading...')
                  ],
                )
              )
            : ListCategories( list: snapshot.data );
         },
      ),
     );
  }
}
