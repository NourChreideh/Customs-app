
import 'package:dmpcreative/utility/globalColors.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
   CustomTextfield({
    Key? key,
    required this.hint,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius,
    this.maxline,
    this.initial,
  
  }) : super(key: key);

  final String hint;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final Icon? suffixIcon;
  final double? borderRadius;
  final int ?maxline;
   String ?initial;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 10),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
       height: MediaQuery.of(context).size.height * 0.073,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
 
        ),
        child: TextFormField(
          maxLines:widget.maxline,
          controller: widget.controller,
   
    style: TextStyle(color: Colors.white),
         initialValue: widget.initial,
          decoration: InputDecoration(
        
            hintStyle: TextStyle(fontSize: 17,color: Colors.grey),
             prefixIcon:widget.prefixIcon,
            filled: true,
            fillColor: GlobalColors.mainColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: widget.hint,
          ),
        ),
      ),
    );
  }
}
