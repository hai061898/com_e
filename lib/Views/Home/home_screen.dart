import 'package:e_com/Bloc/general/general_bloc.dart';
import 'package:e_com/Widgets/bottom_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    final size =  MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor:const  Color(0xfff5f5f5),
      body: Stack(
        children: [

          // ListHome(),
          
          Positioned(
            bottom: 20,
            child: SizedBox(
              width: size.width,
              child: Align(
                child: BlocBuilder<GeneralBloc, GeneralState>(
                  builder: (context, state) =>  BottomNavigationFrave(index: 0, showMenu: state.showMenuHome)
                )
              )
            ),
          ),

          
        ],
      ),
     );
  }
}