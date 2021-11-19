import 'package:e_com/Views/Account/account_screen.dart';
import 'package:e_com/Views/Cart/cart.dart';
import 'package:e_com/Views/Favorite/favorite_screen.dart';
import 'package:e_com/Views/Home/home_screen.dart';
import 'package:e_com/Views/Loading/loading_screen.dart';
import 'package:e_com/Views/Presentation/presentiton_screen.dart';
import 'package:e_com/Views/Signin/signin_screen.dart';
import 'package:e_com/Views/Signup/signup_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  'loadingPage': (context) => const LoadingPage(),
  'getStarted': (context) => const HomeScreenPage(),
  'signInPage': (context) => const SignInPage(),
  'signUpPage': (context) => SignUpPage(),
  'homePage': (context) => const HomePage(),
  'cartPage': (context) => const CartPage(),
  'favoritePage': (context) => const FavoritePage(),
  'profilePage': (context) => const ProfilePage(),
};

// tạo map 
// map có key và value 
// tên là key , page là value 
