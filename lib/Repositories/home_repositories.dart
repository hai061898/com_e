import 'dart:convert';

import 'package:e_com/Data/Models/Home/categories_products.dart';
import 'package:e_com/Data/Models/Home/home_carousel.dart';
import 'package:e_com/Data/Models/Home/products_home.dart';
import 'package:e_com/Repositories/auth_repositories.dart';
import 'package:http/http.dart' as http;

class HomeRepositories {
  String server = 'http://127.0.0.1/api';

  Future<List<SliderHome>> getHomeCarouselSlider() async {
    final token = await authRepositories.readToken();
    final resp = await http.get(Uri.parse('$server/home-carousel'),
        headers: {'Accept': 'application/json', 'xx-token': token!});
    return HomeCarousel.fromJson(jsonDecode(resp.body)).slider;
    //trả về trường slider
  }

  Future<List<Category>> getListCategoriesProducts() async {
    final token = await authRepositories.readToken();

    final resp = await http.get(Uri.parse('$server/list-categories'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return CategoriesProducts.fromJson(jsonDecode(resp.body)).categories;
  }

  Future<List<Product>> getListProductsHome() async {
    final token = await authRepositories.readToken();

    final resp = await http.get(Uri.parse('$server/list-products-home'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return ProductsHome.fromJson(jsonDecode(resp.body)).products;
  }

  Future<List<Category>> getListCategories() async {
    final token = await authRepositories.readToken();

    final resp = await http.get(Uri.parse('$server/list-categories-all'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return CategoriesProducts.fromJson(jsonDecode(resp.body)).categories;
  }
}

final homeRepositories = HomeRepositories();
