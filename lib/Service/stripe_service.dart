// import 'package:http/http.dart' as http ;

class StripeService
{

//   StripeService._privateConstructor();
//   static final _intance = StripeService._privateConstructor();
//   factory StripeService() => _intance;

//   String _paymentApiUrl = "https://api.stripe.com/v1/payment_intents";
//   // link đường api 
//   String _secretKey = "Here your Secret Key - Stripe";
//   // key api stripe
//   String _apiKey = "Here you Api Key - Stripe";
//   // key api tài khoảng bạn trên sẻvice


  // void init(){

  //   StripePayment.setOptions(
  //     StripeOptions(
  //       publishableKey: _apiKey,
  //       androidPayMode: 'test',
  //       merchantId: 'test'
  //     )
  //   );
  //   // tùy chọn 
  // }

//   // Future<StripeResponseCustom> payWithCardExists({ @required String amount, @required String currency, @required CreditCard creditCard }) async {

//   //   try {

//   //     final paymentMethod = await StripePayment.createPaymentMethod( PaymentMethodRequest( card: creditCard ) );
//   //     //thực hiện hành đông tạo 
//   //     return await _makePayment(amount: amount, currency: currency, paymentMethod: paymentMethod );
//   //     // trả thông tin 
      
//   //   } catch (e) {
//   //     return StripeResponseCustom(ok: false, msg: e.toString()); // xuất ra lỗi
//   //   }

//   // } // thanh toán với card ngân hàng có sắn 

//   // Future<StripeResponseCustom> payWithNewCard({ @required String amount, @required String currency }) async {

//   //     try {

//   //         final paymentMethod = await StripePayment.paymentRequestWithCardForm(
//   //           CardFormPaymentRequest()
//   //         );

//   //         return await _makePayment(amount: amount, currency: currency, paymentMethod: paymentMethod );

        
//   //     } catch (e) {
//   //       return StripeResponseCustom(ok: false, msg: e.toString());
//   //     }


//   // } // thanh toán bằng card ngân hành khác 


//   // Future<PaymentIntentResponse> _paymentIntent({ @required String amount, @required String currency }) async {

//   //     try {

//   //       final resp = await http.post(Uri.parse( _paymentApiUrl ),
//   //         headers: {
//   //           'Accept': 'application/json',
//   //           'Authorization' : 'Bearer $_secretKey'
//   //         },
//   //         body: {
//   //           'amount': amount,
//   //           'currency': currency
//   //         }
//   //       );

//   //       return PaymentIntentResponse.fromJson( jsonDecode( resp.body ) );
        
//   //     } catch (e) {
//   //       return PaymentIntentResponse(status: '400'); // 400 : lỗi yếu cầu tệ 
//   //     }

//   // } // mục đích thanh toán là gì 


//   // Future<StripeResponseCustom> _makePayment({ @required String amount, @required String currency, @required PaymentMethod paymentMethod }) async {

//   //     try {

//   //       final paymentIntent = await _paymentIntent(amount: amount, currency: currency);

//   //       final paymentResult = await StripePayment.confirmPaymentIntent(
//   //         PaymentIntent(
//   //           clientSecret: paymentIntent.clientSecret,
//   //           paymentMethodId: paymentMethod.id
//   //         )
//   //       );

//   //       if( paymentResult.status == 'succeeded' ){
//   //         return StripeResponseCustom(ok: true);
//   //       } else {
//   //         return StripeResponseCustom(ok: false, msg: 'Something went wrong');
//   //       }
        
//   //     } catch (e) {
//   //       return StripeResponseCustom(ok: false, msg: e.toString());
//   //     }
//   // } // tạo hành động thành toán


}

final stripeService = StripeService();