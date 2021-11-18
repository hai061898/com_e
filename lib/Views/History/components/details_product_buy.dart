import 'package:e_com/Data/Models/Response/purchased_products.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';

class DetailsProductsBuy extends StatelessWidget {
  final PurchasedProductsResponse? purchased;

  const DetailsProductsBuy({Key? key, this.purchased}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      itemCount: purchased!.orderBuy.length,
      itemBuilder: (_, i) => Container( //(_,i) _ đó nghĩ là k đối số 
        height: 400,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        margin: const EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: TextFrave(
                    text: purchased!.orderBuy[i].receipt, fontSize: 21)),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextFrave(
                    text: 'Date ', fontSize: 19, color: Colors.grey),
                TextFrave(text: '${purchased!.orderBuy[i].datee}', fontSize: 19),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextFrave(
                    text: 'Amount ', fontSize: 19, color: Colors.grey),
                TextFrave(
                    text: '\$ ${purchased!.orderBuy[i].amount}', fontSize: 19),
              ],
            ),
            const SizedBox(height: 10.0),
            const Divider(),
            const SizedBox(height: 10.0),
            const TextFrave(text: 'Products', fontSize: 19),
            const SizedBox(height: 10.0),
            Container(
              height: 220,
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: const Color(0xfff5f5f5),
                  borderRadius: BorderRadius.circular(15.0)),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: purchased!.orderDetails.length,
                itemBuilder: (_, i) => Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 100,
                        child: Image.network('http://127.0.0.1/' +
                            purchased!.orderDetails[i].picture),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        height: 150,
                        width: MediaQuery.of(context).size.width * .53,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                TextFrave(
                                    text: purchased!.orderDetails[i].nameProduct,
                                    fontSize: 17),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            TextFrave(
                                text: '\$ ${purchased!.orderDetails[i].price}',
                                fontSize: 18),
                            const SizedBox(height: 10.0),
                            Container(
                                alignment: Alignment.center,
                                height: 29,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: Color(0xfff5f5f5),
                                    shape: BoxShape.circle),
                                child: TextFrave(
                                    text:
                                        '${purchased!.orderDetails[i].quantity}',
                                    fontSize: 19)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
