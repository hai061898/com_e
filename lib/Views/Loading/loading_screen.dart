import 'package:e_com/Bloc/auth/auth_bloc.dart';
import 'package:e_com/Widgets/animation_router.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LogInState) {
          Navigator.of(context).pushReplacement(
              rutaFrave(page: HomePage(), curved: Curves.easeInOut));
          // page: là chuyển sang screen nào đó
          //   Navigator.of(context).pushReplacement chuyển đến trang nào trong routes
          //   rutaFrave hàm animetion (trong thư mục widgets)
          //Curves là kiểu chuyển sang trang như thế nào (Curves.easeOut làm cho hoạt ảnh bắt đầu nhanh và kết thúc chậm.)  
        } else if (state is LogOutState) {
          Navigator.of(context).pushReplacement(
              rutaFrave(page: HomeScreenPage(), curved: Curves.easeInOut));
        }
      },
      child: Scaffold(
        backgroundColor:const  Color(0xff1E4DD8),
        body: Center(
          child: Container(
            padding:const  EdgeInsets.all(15.0),
            height: 120,
            width: 280,
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const TextFrave(
                    text: 'FRAVE SHOP',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),

                //TextFrave trong thư mục Widgets 
                const SizedBox(height: 20.0),
                Row(
                  children:const  [
                     CircularProgressIndicator(),
                    SizedBox(width: 15.0),
                    TextFrave(
                      text: 'Checking your device',
                      fontSize: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
