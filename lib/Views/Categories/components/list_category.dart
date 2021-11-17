import 'package:e_com/Data/Models/Home/categories_products.dart';
import 'package:e_com/Widgets/animation_router.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListCategories extends StatelessWidget 
{
  
  final List<Category>? list;

  const ListCategories({Key? key , this.list}) : super(key: key);

  

  @override
  Widget build(BuildContext context) 
  {
    return GridView.builder(
      physics:const  BouncingScrollPhysics(),
      padding:const  EdgeInsets.all(10.0),
      gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        mainAxisExtent: 180
      ),
      itemCount: list!.isEmpty ? 0 : list!.length,
      itemBuilder: (context, i) => GestureDetector(
        child: Container(
          padding:const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color:const Color(0xff0C6CF2).withOpacity(.2),
            borderRadius: BorderRadius.circular(15.0)
          ),
          child: Column(
            children: [
              SvgPicture.network('http://127.0.0.1/'+ list![i].picture, height: 85, color: const Color(0xff0C6CF2)),
              const SizedBox(height: 10.0),
              TextFrave(text: list![i].category, fontSize: 22)
            ],
          ),
        ),
        onTap: () => Navigator.of(context).push(rutaFrave(page: CategoryProductsPage(uidCategory: list![i].uidCategory.toString(), category: list![i].category), curved: Curves.easeInOut))
      ),
    );
  }
}