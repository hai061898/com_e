import 'package:e_com/Data/Models/products_cart.dart';
import 'package:e_com/Repositories/product_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState());
  List<ProductCart> product =[];
  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is AddOrDeleteProductFavorite) {
      yield* mapEventAddOrDeleteProductFavorite(event.uidProduct.toString());
    } else if (event is AddProductToCart) {
      final hasProduct = product.contains(event.product);
      //contains xét xem chuỗi tồn tại trong cart
      if (!hasProduct) {
        product.add(event.product!);
        //thêm
        double sum = 0;
        for (var e in product) {
          sum = sum + e.price;
        }

        yield state.copyWith(
            products: product, total: sum, amount: product.length);
        //trả state các trường dữ liệu
      }
    } else if (event is DeleteProductToCart) {
      double sum = 0;
      for (var e in product) {
        sum = sum + e.price;
      }

      yield state.copyWith(
          products: product, total: sum, amount: product.length);
    } else if (event is PlusQuantityProduct) {
      product[event.plus!].amount++;

      double total = 0;
      for (var e in product) {
        total = total + (e.price * e.amount);
      }

      yield state.copyWith(products: product, total: total);
    } else if (event is SubtractQuantityProductEvent) {
      product[event.subtract!].amount--;

      double total = 0;
      for (var e in product) {
        total = total - (e.price * e.amount);
      }

      yield state.copyWith(products: product, total: total.abs());
    } else if ( event is ClearProductsEvent ){

          product.clear();

          yield state.copyWith(
            amount: 00,
            delivery: 0.0,
            insurance: 0.0,
            products: product,
            total: 00.0,
          );

      
      }
      else if ( event is SaveProductsBuy ){

          try {

            await productRepositorie.saveOrderBuyProduct(
              receipt: 'Ticket',
              date: event.date!,
              amount: event.amount!,
              products: product
              );
            
          } catch (e) {
            debugPrint('Something went wrong!');
            debugPrint(e.toString());
          }


      }
  
  
  }




    Stream<ProductState> mapEventAddOrDeleteProductFavorite(
        String uidProduct) async* {
      try {
        final resp = await productRepositorie.addOrDeleteProductFavorite(
            uidProduct: uidProduct);

        if (resp.resp) {}

        // ignore: empty_catches
      } catch (e) {}
    }
}
