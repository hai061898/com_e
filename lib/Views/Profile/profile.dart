import 'package:e_com/Bloc/auth/auth_bloc.dart';
import 'package:e_com/Bloc/personal/personal_bloc.dart';
import 'package:e_com/Helpers/modal_loading.dart';
import 'package:e_com/Helpers/model_frave.dart';
import 'package:e_com/Repositories/person_repositories.dart';
import 'package:e_com/Widgets/btn_frave.dart';
import 'package:e_com/Widgets/form_frave.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationPage extends StatefulWidget
{
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> 
{

  TextEditingController? firstnameController;
  TextEditingController? lastnameController;
  TextEditingController? phoneController;
  TextEditingController? addressController;
  TextEditingController? referenceController;
  final _keyForm = GlobalKey<FormState>();

  getPersonalInformation() async {

    final information = await personalRepositories.getPersonalInformation();

    firstnameController = TextEditingController(text: information.information.firstName );
    lastnameController  = TextEditingController(text: information.information.lastName );
    phoneController     = TextEditingController(text: information.information.phone );
    addressController   = TextEditingController(text: information.information.address );
    referenceController = TextEditingController(text: information.information.reference );

    setState(() {});
  }

  @override
  void initState() {
    getPersonalInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    final auth = BlocProvider.of<AuthBloc>(context);
    final personalBloc = BlocProvider.of<PersonalBloc>(context);

    return BlocListener<PersonalBloc, PersonalState>(
      listener: (context, state) {

        if( state is LoadingPersonalState ) {
        
          modalLoading(context, 'Adding user...'); 
        
        }else if( state is SuccessRegisterPersona ) {
          
          Navigator.of(context).pop();
          modalFrave(context, 'User Added'); 
        
        } else if( state is FailureRegisterState ){

          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: TextFrave(text: 'Error adding user'), backgroundColor: Colors.red ));
        }

      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const TextFrave(text: 'My Profile', color: Colors.black ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black,),
            onPressed: () => Navigator.of(context).pop(),
          )
        ),
        body: Form(
          key: _keyForm,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            //kéo scoll qua hạn phần tử 
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, 
            // loại bỏ bàn phím phím ảo khi kéo scoll
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            children: [

              const TextFrave(text: 'Account data', fontSize: 18),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xff4C98EE).withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextFrave(text: 'User', fontSize: 18),
                        TextFrave(text: auth.state.username, fontSize: 18),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextFrave(text: 'Email', fontSize: 18),
                        TextFrave(text: auth.state.email, fontSize: 18),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30.0),
              const TextFrave(text: 'Personal Information', fontSize: 18),
              const SizedBox(height: 10.0),
              TextFormFrave(
                controller: firstnameController,
                hintText: 'Enter your First Name',
                prefixIcon: Icons.person_outline_rounded,
                fontSize: 18,
              ),
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: lastnameController,
                hintText: 'Enter Last Name',
                prefixIcon: Icons.person_outline_rounded,
                fontSize: 18,
              ),
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: phoneController,
                hintText: 'Enter your Phone Number',
                prefixIcon: Icons.phone_android_rounded,
                type: TextInputType.phone,
                fontSize: 18,
              ),
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: addressController,
                hintText: 'Street Address',
                prefixIcon: Icons.home_outlined,
                type: TextInputType.streetAddress,
                fontSize: 18,
              ),
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: referenceController,
                hintText: 'Reference',
                prefixIcon: Icons.home_outlined,
                type: TextInputType.streetAddress,
                fontSize: 18,
              ),
              const SizedBox(height: 35.0),
              BtnFrave(
                text: 'Save',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                height: 55,
                onPressed: () {
                  if( _keyForm.currentState!.validate() ){
                    personalBloc.add( RegisterPersonalInformationEvent(
                        name: firstnameController!.text,
                        lastName: lastnameController!.text,
                        phone: phoneController!.text,
                        address: addressController!.text,
                        reference: referenceController!.text
                      )
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