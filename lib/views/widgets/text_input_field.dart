import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../material/colors.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObs;
  final IconData icon;
  const TextInputField({Key? key, required this.controller, required this.labelText,this.isObs = false, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller ,
      decoration: InputDecoration(
        labelText:labelText ,
        prefixIcon:Icon(icon) ,
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color:borderColor
          )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
                color:borderColor
            )
        ),
      ),
      obscureText: isObs,
    );
  }
}
