import 'package:e_com/Data/Models/Home/products_home.dart';
import 'package:e_com/Repositories/product_repositories.dart';
import 'package:e_com/Widgets/staggered_dual_view.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryProductsPage extends StatefulWidget {
  final String uidCategory;
  final String category;

  const CategoryProductsPage({Key? key, required this.uidCategory, required this.category}):super(key:key);

  @override
  _CategoryProductsPageState createState() => _CategoryProductsPageState();
}


class _CategoryProductsPageState extends State<CategoryProductsPage> 
{

  List<Product>? listProduct = [];

  getProducts() async {

    listProduct = await productRepositorie.getProductsForCategories(id: widget.uidCategory );
    setState(() { });
  }


  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        title: TextFrave(text: widget.category, color: Colors.black),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StaggeredDualView(
          itemCount: listProduct!.length,
          spacing: 5,
          alturaElement: 0.15,
          aspectRatio: 0.8,
          itemBuilder: (_, i) 
            => Card(
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
              elevation: 10.0,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                splashColor: Colors.blue[300],
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailsProductPage(product: listProduct![i]))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                          child: Hero(
                            tag: listProduct![i].uidProduct.toString(),
                            child: Image.network('http://127.0.0.1/'+ listProduct![i].picture, height: 150,)
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          listProduct![i].nameProduct,
                          style: GoogleFonts.getFont('Roboto', fontSize: 17, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        TextFrave(text: '\$ ${listProduct![i].price}', fontSize: 16 ),
                    ],
                  ),
                ),
              ),
            )
        ),
      )
     );
  }
}