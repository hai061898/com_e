import 'package:e_com/Widgets/btn_frave.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E4DD8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 180,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('Assets/logo-white.png')))),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          TextFrave(
                              text: 'FRAVE', fontSize: 32, color: Colors.white),
                          TextFrave(
                              text: ' SHOP',
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ],
                      ),
                      const TextFrave(
                        text: 'All your products in your hands',
                        fontSize: 20,
                        color: Colors.white60,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: ListView(
                    physics: const BouncingScrollPhysics(), // có thanh cuộng
                    children: [
                      BtnFrave(
                          text: 'Sign Up with Email ID',
                          color: const Color(0xff1C2834),
                          onPressed: () => Navigator.of(context)
                              .pushNamed('signUpPage')), //router = name
                      const SizedBox(height: 15.0),
                      const BtnFrave(
                        text: 'Sign Up with Google',
                        color: Color(0xFFE9EFF9),
                        textColor: Colors.black,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextFrave(
                              text: 'Already have an account?', fontSize: 17),
                          TextButton(
                            child: const TextFrave(
                                text: 'Sign In',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            onPressed: () =>
                                Navigator.of(context).pushNamed('signInPage'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
