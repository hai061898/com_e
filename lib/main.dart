import 'package:e_com/Bloc/auth/auth_bloc.dart';
import 'package:e_com/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/cart/cart_bloc.dart';
import 'Bloc/general/general_bloc.dart';
import 'Bloc/personal/personal_bloc.dart';
import 'Bloc/product/product_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark ));
    // mặc đinh cho phần statusBar color , icon color
      
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add( CheckLoginEvent() ) ),
        BlocProvider(create: (context) => GeneralBloc()),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => PersonalBloc()),
        BlocProvider(create: (context) => CartBloc()),
      ], // gọi các provider 
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commers Products',
        initialRoute: 'loadingPage',
        routes: routes,
        // loading trang từ routes 
      ),
    );
  }
}