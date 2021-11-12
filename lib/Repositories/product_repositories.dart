import 'dart:convert';

import 'package:e_com/Data/Models/Home/products_home.dart';
import 'package:e_com/Data/Models/Product/favorite_product.dart';
import 'package:e_com/Data/Models/Response/purchased_products.dart';
import 'package:e_com/Data/Models/products_cart.dart';
import 'package:e_com/Data/Models/response_models.dart';
import 'package:e_com/Repositories/auth_repositories.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ProductRepositories
{

  String server = 'http://127.0.0.1/api';
  final secureStorage =const  FlutterSecureStorage();
  

  Future<ResponseModels> addOrDeleteProductFavorite({required String uidProduct }) async {

      final token = await authRepositories.readToken();

      final resp = await http.post(Uri.parse('$server/add-Favorite-Product'),
        headers: { 'Accept'   : 'application/json', 'xx-token' : token! },
        body: {
          'uidProduct' : uidProduct,
          'uidUser'    : await secureStorage.read(key: 'uid')
        }
      );

      return ResponseModels.fromJson( jsonDecode( resp.body ) );
  }

  Future<List<Favorite>> favoriteProducts() async {

      final token = await authRepositories.readToken();

      final resp = await http.get(Uri.parse('$server/product-favorite-for-user'),
        headers: { 'Accept'   : 'application/json', 'xx-token' : token! },
      );

      return FavoriteProduct.fromJson( jsonDecode( resp.body ) ).favorites;
  }


  Future<ResponseModels> saveOrderBuyProduct({required String receipt,required String date,required String amount, List<ProductCart>? products }) async {

      final token = await authRepositories.readToken();

      Map<String, dynamic> data = {
        'receipt' : receipt,
        'date'    : date,
        'amount'  : amount,
        'products': products
      }; // cart Map luôn key , value

      final body = json.encode( data );
      
      final resp = await http.post(Uri.parse('$server/save-order-products'),
        headers: { 'Content-type' : 'application/json', 'xx-token' : token! },
        body: body
      );

      return ResponseModels.fromJson( jsonDecode( resp.body ) );
  }


  Future<PurchasedProductsResponse> getPurchasedProducts() async {

      final token = await authRepositories.readToken();

      final response = await http.get(Uri.parse('$server/get-purchased-products'),
        headers: { 'Content-type'   : 'application/json', 'xx-token' : token! },
      );

      return PurchasedProductsResponse.fromJson( jsonDecode( response.body ) );
  }


  Future<List<Product>> getProductsForCategories({required String id }) async {

    final token = await authRepositories.readToken();

      final response = await http.get(Uri.parse('$server/get-products-for-categories/'+ id ),
        headers: { 'Content-type'   : 'application/json', 'xx-token' : token! },
        // 'content-tpye':định dạng theo yêu cầu
      );

    return ProductsHome.fromJson( jsonDecode( response.body ) ).products;

  }



}

final productRepositorie = ProductRepositories();