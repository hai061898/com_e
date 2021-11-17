
import 'package:e_com/Bloc/product/product_bloc.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsProducts extends StatelessWidget {
  const DetailsProducts({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) 
  {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .7,
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) 
            => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.products!.length,
            itemBuilder: (context, i) {
              
              return Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding: const EdgeInsets.all(15.0),
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xffF5F5F5)
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Image.network('http://127.0.0.1/'+ state.products![i].image )
                        ),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 230,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 205,
                                    child: TextFrave(text: state.products![i].name, fontSize: 19, textOverflow: TextOverflow.ellipsis )
                                  ),
                                  GestureDetector(
                                    onTap: () => productBloc.add( DeleteProductToCart(index: i) ),
                                    child: const Icon(Icons.close, color: Colors.red, size: 25)
                                )
                              ],
                              ),
                            ),
                          const SizedBox(height: 10.0),
                          TextFrave(text: '\$ ${state.products![i].price}', fontSize: 22, fontWeight: FontWeight.w600 ),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            width: 230,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0))
                                    ),
                                    child: const Icon(Icons.remove, color: Color(0xff0C6CF2) ),
                                  ),
                                  onTap: (){
                                    if( state.products![i].amount > 1 ){
                                      productBloc.add( SubtractQuantityProductEvent(subtract: i) );
                                    }
                                  },
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  color: Colors.white,
                                  child: Center(child: TextFrave(text: '${state.products![i].amount}', fontSize: 18)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    productBloc.add( PlusQuantityProduct(plus: i));
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration:const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0))
                                    ),
                                    child:const Icon(Icons.add, color: Color(0xff0C6CF2) ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
              );
            },
          ),
        ),
      ),
    );
  }
}