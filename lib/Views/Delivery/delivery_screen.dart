import 'package:e_com/Bloc/personal/personal_bloc.dart';
import 'package:e_com/Helpers/modal_loading.dart';
import 'package:e_com/Helpers/model_frave.dart';
import 'package:e_com/Repositories/person_repositories.dart';
import 'package:e_com/Widgets/btn_frave.dart';
import 'package:e_com/Widgets/form_frave.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}


class _DeliveryPageState extends State<DeliveryPage> 
{

  TextEditingController streetAddress = TextEditingController();
  TextEditingController referenceController = TextEditingController();
  TextEditingController? zipCode;


  getPersonalInformation() async {
    final info = await personalRepositories.getPersonalInformation();

    BlocProvider.of<PersonalBloc>(context).add( GetStreetAddress(address: info.information.address, reference: info.information.reference) );

    setState(() {});
  } // lấy thông tin người 

  @override
  void initState() {
    getPersonalInformation();
    super.initState();
  } // hàm khỏi tạo 


  @override
  Widget build(BuildContext context)
  {
    final personalBloc = BlocProvider.of<PersonalBloc>(context);

    return BlocListener<PersonalBloc, PersonalState>(
      listener: (context, state) {
        if( state is LoadingPersonalState ) {
        
          modalLoading(context, 'Adding Street Address...'); 
        
        }else if( state is SuccessRegisterPersona ) {
          
          Navigator.of(context).pop();
          modalFrave(context, 'Street Address Added'); 
        
        } else if( state is FailureState ){

          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: TextFrave(text: 'Error adding Street Address'), backgroundColor: Colors.red ));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const TextFrave(text: 'Address', color: Colors.black, fontSize: 21),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<PersonalBloc, PersonalState>(
          builder: (context, state) 
            => ListView(
            children: [

              ( state.address.isEmpty)
              ? Container(
                  margin: const EdgeInsets.only(top: 15.0),
                )
              :Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.blue)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFrave(text: state.address, fontSize: 18,),
                      const Icon(Icons.radio_button_checked_rounded, size: 31, color: Colors.blue )
                    ],
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 15.0),
                alignment: Alignment.center,
                child: const TextFrave(text: 'Or', fontSize: 18,)
              ),

              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormFrave(
                  controller: streetAddress,
                  hintText: 'Street Address',
                  fontSize: 19,
                )
              ),

              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormFrave(
                  controller: referenceController,
                  hintText: 'Reference',
                  fontSize: 19,
                )
              ),

              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormFrave(
                  controller: zipCode,
                  hintText: 'Zip code',
                  fontSize: 19,
                )
              ),

              Container(
                margin: const EdgeInsets.only(top: 40.0),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: BtnFrave(
                  text: 'Save Address', 
                  height: 55, 
                  fontSize: 19,
                  onPressed: () => personalBloc.add( AddStreetAddress(address: streetAddress.text, reference: referenceController.text) ),
                )
              )
            ],
          ),
        ),
       ),
    );
  }
}
