import 'package:e_com/Widgets/bottom_custom.dart';
import 'package:flutter/material.dart';

import 'components/main_account.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: Stack(
        children: [
          const ListProfile(),
          Positioned(
            bottom: 20,
            child: SizedBox(
                width: size.width,
                child: const Align(child: BottomNavigationFrave(index: 4))),
          ),
        ],
      ),
    );
  }
}
