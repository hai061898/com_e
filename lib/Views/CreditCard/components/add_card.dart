import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';

class AddCreditCardPage extends StatelessWidget {
  const AddCreditCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const TextFrave(
              text: 'Add Cards',
              color: Color(0xff0C6CF2),
              fontWeight: FontWeight.w600),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded,
                color: Color(0xff0C6CF2)),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: const Center(
        child: Text('Hai Remake'),
      ),
    );
  }
}
