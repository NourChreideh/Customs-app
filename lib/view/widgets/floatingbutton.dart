import 'package:dmpcreative/view/pages/QrCode.dart';
import 'package:flutter/material.dart';

import '../../utility/globalColors.dart';



class FloattingButton extends StatefulWidget {
  const FloattingButton({super.key});

  @override
  State<FloattingButton> createState() => _FloattingButtonState();
}

class _FloattingButtonState extends State<FloattingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
         boxShadow: [
      BoxShadow(
        color: GlobalColors.SelectedColor, 
        offset: Offset(2,2 ), 
        blurRadius: 20.0, 
      ),
    ],
        ),
        child: FloatingActionButton(
          shape: CircleBorder(

            
          ),
          
          backgroundColor: GlobalColors.SelectedColor,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const QrCode()));
          },
          child:Image.asset("assets/icons/Qr Code.png"),
        ),
      );
  }
}