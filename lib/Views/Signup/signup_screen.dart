import 'package:e_com/Bloc/auth/auth_bloc.dart';
import 'package:e_com/Helpers/modal_loading.dart';
import 'package:e_com/Helpers/model_success.dart';
import 'package:e_com/Helpers/validators_form.dart';
import 'package:e_com/Widgets/btn_frave.dart';
import 'package:e_com/Widgets/form_frave.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpPage extends StatelessWidget
{

  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passowrdController = TextEditingController();
  final passController  = TextEditingController();
  // khai báo các biến TextEditingController để nhập data
  final _formKey = GlobalKey<FormState>();
  // khai báo biến GlobalKey gữi post , thay đỗi state

   SignUpPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    //lấy biến từ authbloc

    return BlocListener<AuthBloc, AuthState>(
      //lắng nghe
      listener: (context, state) {

          if( state is LoadingRegisterState ){

            modalLoading(context, 'Validating...');
          }
          if( state is RegisterSuccess ){
            
            Navigator.of(context).pop();
            modalSuccess(context, 'USER CREATED');
          }
          if( state is FailureRegisterState ){

            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: TextFrave(text: state.error.toString(), fontSize: 18,), backgroundColor: Colors.red)
            );
            // nếu thất bại snackbar hiện ra lỗi
          }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon:const Icon(Icons.close_rounded, color: Colors.black,),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            TextButton(
              child:const TextFrave(text: 'Log In', fontSize: 18, color: Color(0xff0C6CF2)),
              onPressed: () => Navigator.of(context).pushReplacementNamed('signInPage'),
            ),
           const  SizedBox(width: 5)
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding:const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics:const BouncingScrollPhysics(),
            children: [
              const TextFrave(text: 'Welcome to Frave Shop', fontSize: 23, fontWeight: FontWeight.w600),
              const SizedBox(height: 5.0),
              const TextFrave(text: 'Create Account', fontSize: 17),
              const SizedBox(height: 20.0),
              TextFormFrave(
                hintText: 'Username',
                fontSize: 18,
                prefixIcon: Icons.person_outline_rounded,
                controller: userController,
                validator: RequiredValidator(errorText: 'Username is required'),
              ),
              
             const  SizedBox(height: 15.0),
              TextFormFrave(
                hintText: 'Email Address',
                type: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                controller: emailController,
                validator: validatedEmail
              ),
            const   SizedBox(height: 15.0),
              TextFormFrave(
                hintText: 'Password',
                prefixIcon: Icons.vpn_key_rounded,
                obscureText: true,
                controller: passowrdController,
                validator: passwordValidator,
              ),
             const  SizedBox(height: 15.0),
              TextFormFrave(
                hintText: 'Repeat Password',
                controller: passController,
                prefixIcon: Icons.vpn_key_rounded,
                obscureText: true,
                validator: (val) => MatchValidator(errorText: 'Password do not macth ').validateMatch(val!, passowrdController.text)
              ),
              const SizedBox(height: 25.0),

              Row(
                children: const [
                  Icon(Icons.check_circle_rounded, color: Color(0xff0C6CF2)),
                  TextFrave(text: ' I Agree to Frave Shop ', fontSize: 15,),
                  TextFrave(text: ' Terms of Use', fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff0C6CF2)),
                ],
              ),

              const SizedBox(height: 25.0),
              BtnFrave(
                text: 'Sign Up',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: 60,
                onPressed: (){
                  // kiểm tra tính hợp lệ của các textbox
                  if( _formKey.currentState!.validate() ){
                    authBloc.add( RegisterEvent(
                      username: userController.text, email: emailController.text, password: passowrdController.text) 
                    );
                  }
                },
              )
            ],
          ),
        ),
       ),
    );
  }
}
