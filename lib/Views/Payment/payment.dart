import 'package:e_com/Bloc/cart/cart_bloc.dart';
import 'package:e_com/Data/Models/Cart/credit_card.dart';
import 'package:e_com/Data/Models/Cart/list_cart.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

 
  
  @override
  Widget build(BuildContext context)
  {
    final cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const TextFrave(text: 'Payment', color: Colors.black, fontSize: 21),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          InkWell(
            onTap: (){},
            child: Row(
              children: const [
                Icon(Icons.add_circle_outline_rounded, color: Color(0xff0C6CF2), size: 17),
                SizedBox(width: 5.0),
                TextFrave(text: 'Add Card', color: Color(0xff0C6CF2), fontSize: 15),
                SizedBox(width: 7.0),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (_, i) {
                   final CreditCardFrave card = cards[i];

                   return BlocBuilder<CartBloc, CartState>(
                     builder: (context, state) 
                      => GestureDetector(
                       onTap: () => cartBloc.add( OnSelectCard(creditCardFrave: card) ),
                       child: Container(
                         margin: const EdgeInsets.only(bottom: 20.0),
                         padding: const EdgeInsets.all(10.0),
                         height: 80,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(15.0),
                           border: Border.all(
                             color: state.creditCardFrave == null 
                              ? Colors.black
                              : state.creditCardFrave!.cvv == card.cvv ? Colors.blue : Colors.black
                           )
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             SizedBox(
                               height: 80,
                               width: 80,
                               child: SvgPicture.asset('Assets/${card.brand}.svg')
                             ),
                             SizedBox(
                               child: TextFrave(text: '**** **** **** ${card.cardNumberHidden}')
                             ),
                             Container(
                               child: state.creditCardFrave == null 
                               ? const Icon(Icons.radio_button_off_rounded, size: 31)
                               : state.creditCardFrave!.cvv == card.cvv 
                                ? const Icon(Icons.radio_button_checked_rounded, size: 31, color: Colors.blue,)
                                : const Icon(Icons.radio_button_off_rounded, size: 31)
                             )
                           ],
                         ),
                       ),
                     ),
                   );
                } ,
              ),
            ),
          )
        ],
      ),
     );
  }
}