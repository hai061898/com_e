import 'package:e_com/Bloc/auth/auth_bloc.dart';
import 'package:e_com/Helpers/modal_loading.dart';
import 'package:e_com/Helpers/validators_form.dart';
import 'package:e_com/Views/Loading/loading_screen.dart';
import 'package:e_com/Widgets/animation_router.dart';
import 'package:e_com/Widgets/btn_frave.dart';
import 'package:e_com/Widgets/form_frave.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> 
{

  TextEditingController emailController = TextEditingController();
  TextEditingController passowrdController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  bool isChangeSuffixIcon = true;

  @override
  Widget build(BuildContext context)
  {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        
        if( state is LoadingState ){

          modalLoading(context, 'Validating...');
        
        }else if( state is FailureState ){

          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: TextFrave(text: state.error.toString(), fontSize: 18), backgroundColor: Colors.red));
        
        }else if ( state is LogInState ){

          Navigator.of(context).pop();
          // Navigator.pushAndRemoveUntil(context, rutaFrave(page:const HomePage(), curved: Curves.easeInOut), (route) => false);

        } 

      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close_rounded, size: 25, color: Colors.black),
            onPressed: ()=> Navigator.pop(context),
          ),
          actions: [
            TextButton(
              child: const TextFrave(text: 'Register', fontSize: 18, color: Color(0xff0C6CF2),),
              onPressed: () => Navigator.of(context).pushReplacementNamed('signUpPage'),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Form(
            key: _keyForm,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              physics: const BouncingScrollPhysics(),
              children: [

                const SizedBox(height: 20),
                const TextFrave(text: 'Welcome Back!', fontSize: 34, fontWeight: FontWeight.bold, color: Color(0xff0C6CF2)),
                const SizedBox(height: 5),
                const TextFrave(text: 'Sign In to your account', fontSize: 18),
                const SizedBox(height: 35),

                TextFormFrave(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validator: validatedEmail,
                  hintText: 'Enter your Email ID',
                  fontSize: 20,
                  isIcon: false,
                ),
                const SizedBox(height: 20),
                TextFormFrave(
                  controller: passowrdController,
                  obscureText: isChangeSuffixIcon,
                  hintText: 'Enter your password',
                  fontSize: 20,
                  isIcon: false,
                  suffixIcon: isChangeSuffixIcon ?  Icons.visibility_off_outlined :  Icons.visibility_outlined,
                  isSuffixIcon: true,
                  onPressedSuffixIcon: () => setState(() => isChangeSuffixIcon =! isChangeSuffixIcon ),
                  validator: passwordValidator,
                ),
                const SizedBox(height:  40),

                BtnFrave(
                  text: 'Continue',
                  height: 60,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  onPressed: (){
                    if( _keyForm.currentState!.validate() ){
                      authBloc.add( LoginEvent(email: emailController.text, password: passowrdController.text) );
                    }
                  },
                ),

                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    child: const TextFrave(text: 'Forgot password?', color: Colors.black, fontSize: 17),
                    onPressed: () => Navigator.of(context).push(rutaFrave(page:const LoadingPage(), curved: Curves.easeInOut)),
                  ),
                ),

              ],
            ),
          ),
        ),
       ),
    );
  }
}