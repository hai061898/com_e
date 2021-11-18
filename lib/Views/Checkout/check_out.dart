import 'package:e_com/Bloc/cart/cart_bloc.dart';
import 'package:e_com/Bloc/personal/personal_bloc.dart';
import 'package:e_com/Bloc/product/product_bloc.dart';
import 'package:e_com/Helpers/modal_loading.dart';
import 'package:e_com/Helpers/model_payment.dart';
import 'package:e_com/Service/stripe_service.dart';
import 'package:e_com/Widgets/animation_router.dart';
import 'package:e_com/Widgets/btn_frave.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/order_detail.dart';
import 'components/promo_code.dart';

class CheckOutPagePage extends StatelessWidget {
  const CheckOutPagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StripeService();
    // .init(); // gọi hàm init() bên striper service

    final productBloc = BlocProvider.of<ProductBloc>(context);
    final personalBloc = BlocProvider.of<PersonalBloc>(context);
    final cartBloc = BlocProvider.of<CartBloc>(context);

    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state is LoadingPaymentState) {
          modalLoading(context, 'Making payment...');
        } else if (state is SuccessPaymentState) {
          Navigator.pop(context);
          modalPayment(context);
        } else if (state is FailurePaymentState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: TextFrave(text: state.err.toString(), fontSize: 17),
              backgroundColor: Colors.red));
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff3f4f8),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const TextFrave(
              text: 'Checkout', color: Colors.black, fontSize: 21),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              color: Colors.white,
              height: 96,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextFrave(
                          text: 'Shipping address',
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                      GestureDetector(
                        child: TextFrave(
                            text: personalBloc.state.address.isEmpty
                                ? 'Add'
                                : 'Change',
                            color: Colors.blue,
                            fontSize: 18),
                        onTap: () => Navigator.of(context).push(rutaFrave(
                            page: DeliveryPage(), curved: Curves.easeInOut)),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 5.0),
                  BlocBuilder<PersonalBloc, PersonalState>(
                      builder: (context, state) => (state.address.isEmpty)
                          ? const TextFrave(
                              text: 'Without Street Address', fontSize: 18)
                          : TextFrave(
                              text: personalBloc.state.address, fontSize: 18))
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                height: 113,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextFrave(
                            text: 'Payment',
                            fontSize: 19,
                            fontWeight: FontWeight.w600),
                        GestureDetector(
                            child: BlocBuilder<CartBloc, CartState>(
                                builder: (context, state) => (!state.cardActive)
                                    ? const TextFrave(
                                        text: 'Add',
                                        color: Colors.blue,
                                        fontSize: 18)
                                    : const TextFrave(
                                        text: 'Change',
                                        color: Colors.blue,
                                        fontSize: 18)),
                            onTap: () => Navigator.of(context).push(rutaFrave(
                                page: PaymentPage(), curved: Curves.easeInOut)))
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 5.0),
                    BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) => (!state.cardActive)
                            ? const TextFrave(
                                text: 'Without Credit Card', fontSize: 18)
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                color: const Color(0xfff5f5f5),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: SvgPicture.asset(
                                            'Assets/${state.creditCardFrave!.brand}.svg')),
                                    const SizedBox(width: 15.0),
                                    TextFrave(
                                      text:
                                          '**** **** **** ${state.creditCardFrave!.cardNumberHidden}',
                                      fontSize: 18,
                                    )
                                  ],
                                ),
                              ))
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(15.0),
              height: 100,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TextFrave(
                      text: 'Delivery Details',
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                  Divider(),
                  TextFrave(text: 'Stander Delivery (3-4 days)', fontSize: 18),
                ],
              ),
            ),
            const PromoCode(),
            const OrderDetails(),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextFrave(
                    text: 'Total',
                    fontSize: 19,
                  ),
                  TextFrave(
                    text: '\$ ${productBloc.state.total}',
                    fontSize: 19,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              alignment: Alignment.bottomCenter,
              child: BtnFrave(
                text: 'Pay',
                height: 55,
                fontSize: 22,
                onPressed: () {
                  cartBloc.add(OnMakePayment(
                      amount: '${(productBloc.state.total * 100).floor()}',
                      creditCardFrave: cartBloc.state.creditCardFrave));
                  productBloc.add(SaveProductsBuy(
                      date: DateTime.now().toString(),
                      amount: '${productBloc.state.total}',
                      product: productBloc.product));
                  productBloc.add(ClearProductsEvent());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
