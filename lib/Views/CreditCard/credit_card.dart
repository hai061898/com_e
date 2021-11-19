import 'package:e_com/Data/Models/Cart/list_cart.dart';
import 'package:e_com/Widgets/animation_router.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';

import 'components/add_card.dart';
import 'components/credit_card_custom.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const TextFrave(
            text: 'My Cards',
            color: Color(0xff0C6CF2),
            fontWeight: FontWeight.w600),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: Color(0xff0C6CF2)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                const Icon(Icons.add_circle_outline_rounded,
                    color: Color(0xff0C6CF2), size: 17),
                const SizedBox(width: 5.0),
                GestureDetector(
                  child: const TextFrave(
                      text: 'Add Card', color: Color(0xff0C6CF2), fontSize: 15),
                  onTap: () => Navigator.of(context).push(rutaFrave(
                      page:const AddCreditCardPage(), curved: Curves.easeInOut)),
                ),
                const SizedBox(width: 7.0),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: PageController(viewportFraction: .9),
                physics: BouncingScrollPhysics(),
                itemCount: cards.length,
                itemBuilder: (_, i) {
                  final card = cards[i];

                  return CreditCard(
                    cardHolderName: card.cardHolderName,
                    cardNumber: card.cardNumber,
                    expiryDate: card.expiracyDate,
                    cvvCode: card.cvv,
                    brand: card.brand,
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            const TextFrave(text: 'Last movements', fontSize: 19),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
