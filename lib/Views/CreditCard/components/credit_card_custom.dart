import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCard extends StatelessWidget {

  final String? cardNumber;
  final String? expiryDate;
  final String? cardHolderName;
  final String? cvvCode;
  final String? brand;

  const CreditCard({
    Key? key,
    this.cardNumber, 
    this.expiryDate, 
    this.cardHolderName, 
    this.cvvCode,
    this.brand
  }):super(key:key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      margin: const EdgeInsets.only(right: 15.0),
      height: 220,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xFF3A4960)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('Assets/card-chip.png', height: 60),
              SvgPicture.asset('Assets/$brand.svg', height: 80 )
            ],
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: TextFrave(text: cardNumber!, fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFrave(text: cardHolderName!, fontSize: 23, color: Colors.white ),
                TextFrave(text: expiryDate!, color: Colors.white, fontSize: 19),
              ],
            ),
          )
        ],
      ),
    );
  }
}


