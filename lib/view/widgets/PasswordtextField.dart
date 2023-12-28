import 'package:dmpcreative/utility/globalColors.dart';
import 'package:flutter/material.dart';


class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.hint,
    this.controller,
    this.prefixIcon,
    
    this.suffixIcon,
    this.borderRadius,
        required this.onVisibilityChanged,
  }) : super(key: key);

  final String hint;
   final Function(bool) onVisibilityChanged;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final Icon? suffixIcon;
  final double? borderRadius;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
    bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width * 0.9,
     height: MediaQuery.of(context).size.height * 0.073,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      
      ),
      child: TextFormField(
          controller: widget.controller,
         onChanged: (text) {},
    obscureText: !_isPasswordVisible,
    style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
                  suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
          widget.onVisibilityChanged(_isPasswordVisible);
        },
        icon: _isPasswordVisible
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off_outlined),),
          hintStyle: TextStyle(fontSize: 17,color: Colors.white),
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
    );
  }
}

