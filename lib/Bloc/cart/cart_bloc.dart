import 'package:e_com/Data/Models/Cart/credit_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';
part 'cart_event.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is OnSelectCard) {
      yield state.copyWith(
          cardActive: true, creditCardFrave: event.creditCardFrave!);
    } // setate cho dễ hiêu là thay dỗi trang thái thược tính trong hàm
    else if (event is OnMakePayment) {
      try {
        yield LoadingPaymentState();
        // final mesAnio = event.creditCardFrave!.expiracyDate.split('/');
        // cắt thành output: 01/01/2021
        // final resp = await stripeService.payWithCardExists(
        //     amount: event.amount,
        //     currency: state.currency,
        //     creditCard: CreditCard(
        //       number: event.creditCardFrave.cardNumber,
        //       expMonth: int.parse(mesAnio[0]),
        //       expYear: int.parse(mesAnio[1]),
        //     )
        //   );
        // if( resp.ok ){
        //   yield SuccessPaymentState();
        // } else {
        //   yield FailurePaymentState(err: resp.msg );
        // }

      } catch (e) {
        yield FailurePaymentState(err: e.toString());
      }
    }
  }
}
