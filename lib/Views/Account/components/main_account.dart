import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:e_com/Bloc/auth/auth_bloc.dart';
import 'package:e_com/Helpers/uploadingfile.dart';
import 'package:e_com/Views/History/history_screen.dart';
import 'package:e_com/Views/Presentation/presentiton_screen.dart';
import 'package:e_com/Widgets/animation_router.dart';
import 'package:e_com/Widgets/circle_frave.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'card_account.dart';
import 'divider_custom.dart';

class ListProfile extends StatefulWidget {
  const ListProfile({Key? key}) : super(key: key);

  @override
  _ListProfileState createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> 
{
    late File image;
    String? img;
    final picker = ImagePicker();

    Future getImage() async {

      var pickedFile = await picker.pickImage(source: ImageSource.gallery); // gọi hoạt đông chọn ảnh từ thư viện có sẵn trong máy

      if( pickedFile != null ){ // nếu nó rổng

        image = File( pickedFile.path ); // định dạng file
        img = pickedFile.path; // lấy file 

        BlocProvider.of<AuthBloc>(context).add( ChangePictureProfile(image: img) ); //thêm file 
      }

      setState(() {});
    }

    Future getTakeFoto() async {

      var pickedFile = await picker.pickImage(source: ImageSource.camera); // lấy từ camera

      if( pickedFile != null ){
          image = File( pickedFile.path );
          img = pickedFile.path;
          BlocProvider.of<AuthBloc>(context).add( ChangePictureProfile(image: img) );

        } 
      setState(() {});
  }

  @override
  Widget build(BuildContext context) 
  {
    final size = MediaQuery.of(context).size;
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {

          if( state is LoadingImageState ){

              loadinUploadFile(context); // đang loaing file hiện thông báo này
          } else if ( state is ChangeProfileSuccess ){

            Navigator.of(context).pop(); // nếu thành cồng chuyển về trang trước đồng thời hiên thông báo snackbar
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: TextFrave(text: 'Image Updated success', fontSize: 18), backgroundColor: Colors.green));
          
          } else if( state is LogOutState ) {
            // logout trả về trang homeScreenPage
            Navigator.pushReplacement(context, rutaFrave(page:const HomeScreenPage(), curved: Curves.easeInOut));
          }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
            return ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 35.0, bottom: 90.0),
            children: [

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: state.profile == ''
                    ? GestureDetector(
                        onTap: () => changeProfile(context),
                        child: CircleFrave(
                          radius: 90,
                          child: Center(child: TextFrave(text: state.username.substring(0,2).toUpperCase(), fontSize: 45, color: Colors.white, fontWeight: FontWeight.bold)),
                        )
                      )
                    : GestureDetector(
                        onTap: () => changeProfile(context),
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage( 'http://127.0.0.1/' + state.profile.toString() )
                            )
                          ),
                        ),
                    )
                  ),
                  const SizedBox(width: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BounceInRight(
                        child: Align(
                          alignment: Alignment.center,
                          child: TextFrave(text: state.username , fontSize: 21, color: Colors.black,)
                        ),
                      ),
                      FadeInRight(
                        child: Align(
                          alignment: Alignment.center,
                          child: TextFrave(text: state.email, fontSize: 18, color: Colors.grey,)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              
              Container(
                height: 122,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: Column(
                  children: [
                    CardProfile(
                      text: 'Personal Information', 
                      borderRadius: BorderRadius.circular(50.0),
                      icon: Icons.person_outline_rounded,
                      backgroundColor: const Color(0xff7882ff),
                      onPressed: () => Navigator.of(context).push(rutaFrave(page: InformationPage(), curved: Curves.easeInOut)),
                    ),
                    DividerC(size:size),
                    CardProfile(
                      text: 'Credit Card', 
                      borderRadius: BorderRadius.circular(50.0),
                      icon: Icons.credit_card_rounded,
                      backgroundColor: const Color(0xffFFCD3A),
                      onPressed: () => Navigator.of(context).push(rutaFrave(page: CreditCardPage(), curved: Curves.easeInOut)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15.0),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: TextFrave(text: 'General', fontSize: 17, color: Colors.grey,),
              ),
              const SizedBox(height: 10.0),
              Container(
                height: 243,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: Column(
                  children: [
                      CardProfile(
                        text: 'Settings', 
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30.0)),
                        backgroundColor: const Color(0xff2EAA9B),
                        icon: Icons.settings_applications,
                        onPressed: (){},
                      ),
                      DividerC(size: size,),
                      CardProfile(
                        text: 'Notifications',
                        borderRadius: BorderRadius.zero,
                        backgroundColor: const Color(0xffE87092),
                        icon: Icons.notifications_none_rounded,
                        onPressed: () {},
                      ),
                      DividerC(size: size),
                      CardProfile(
                        text: 'Favorites',
                        backgroundColor: const Color(0xfff28072),
                        icon: Icons.favorite_border_rounded,
                        borderRadius: BorderRadius.zero,
                        onPressed: (){},
                      ),
                      DividerC(size: size),
                      CardProfile(
                        text: 'My Shopping',
                        backgroundColor: const Color(0xff0716A5),
                        icon: Icons.shopping_bag_outlined,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30.0)),
                        onPressed: () => Navigator.of(context).push(rutaFrave(page: const ShoppingPage(), curved: Curves.easeInOut)),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: TextFrave(text: 'Personal', fontSize: 17, color: Colors.grey,),
              ),
              const SizedBox(height: 10.0),
              Container(
                height: 243,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: Column(
                  children: [
                      CardProfile(
                        text: 'Privacy & Policy', 
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30.0)),
                        backgroundColor: const Color(0xff6dbd63),
                        icon: Icons.policy_rounded,
                        onPressed: (){},
                      ),
                      DividerC(size: size),
                      CardProfile(
                        text: 'Security',
                        borderRadius: BorderRadius.zero,
                        backgroundColor: const Color(0xff1F252C),
                        icon: Icons.lock_outline_rounded,
                        onPressed: (){},
                      ),
                      DividerC(size: size),
                      CardProfile(
                        text: 'Term & Conditions',
                        borderRadius: BorderRadius.zero,
                        backgroundColor: const Color(0xff458bff),
                        icon: Icons.description_outlined,
                        onPressed: (){},
                      ),
                      DividerC(size: size),
                      CardProfile(
                        text: 'Help',
                        backgroundColor: const Color(0xff4772e6),
                        icon: Icons.help_outline,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30.0)),
                        onPressed: (){},
                      ),

                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              CardProfile(
                text: 'Sign Out', 
                borderRadius: BorderRadius.circular(50.0),
                icon: Icons.power_settings_new_sharp,
                backgroundColor: Colors.red,
                onPressed: () => authBloc.add( LogOutEvent() ),
              ),
            ],
          );
        },
      ),
    );
  }

  void changeProfile(BuildContext context){

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    enableDrag: false,
    builder: (context) {
      
      return Container(
        height: 190,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 25.0, top: 25.0),
              child: TextFrave(text: 'Change profile picture', fontSize: 20, fontWeight: FontWeight.w500 ),
            ),
            const SizedBox(height: 15.0),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 0,
                child: InkWell(
                  onTap: (){
                    getImage();
                    Navigator.of(context).pop();
                  },
                  child:const  Padding(
                    padding: EdgeInsets.only(left: 22.0),
                    child: Align( alignment: Alignment.centerLeft,child: TextFrave(text: 'Select an image', fontSize: 18 )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 0,
                child: InkWell(
                  onTap: (){
                    getTakeFoto();
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 22.0),
                    child: Align(alignment: Alignment.centerLeft, child: TextFrave(text: 'Take a picture', fontSize: 18,)),
                  ),
                ),
              ),
            ),
          ],
        )
      );
    },
  );

}

  
}