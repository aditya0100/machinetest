import 'package:flutter/material.dart';

import 'validator.dart';


class FormBuilder {
  final TextEditingController controller;
  final dynamic validator;
  final bool? readOnly;
  final TextInputType inputType;
  // final IconData pIcon;
  final String label;
  final double x;
  final double? opacity;
  final Color? textcolor;

  final bool noPadding;

  FormBuilder(
      {required this.controller,
      required this.validator,
      required this.inputType,
      this.readOnly,
      // required this.pIcon,
      required this.label,
      this.noPadding = false,
      required this.x,
      this.opacity,
      this.textcolor});

  Widget buildTextField() {
    return SizedBox(
      // height: 50,
      width: x,
      child: TextFormField(
        readOnly: readOnly ?? false,
          controller: controller,
          style: textcolor!=null? TextStyle(color: textcolor):null,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              hintText: label,
              fillColor: opacity != null
                  ? Colors.white.withOpacity(opacity!)
                  : Colors.grey.shade200,
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14)),
          keyboardType: inputType,
          validator: (value) => validator(value)),
    );
  }

  Widget buildPasswordField(bool passwordVisible, dynamic togglePassword) {
    return SizedBox(
      // height: 50,
      width: x,
      child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !passwordVisible,
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            // prefixIcon: Icon(pIcon, color: Colors.purple),
            suffixIcon: IconButton(
              icon: Icon(
                  !passwordVisible ? Icons.visibility_off : Icons.visibility),
              color: Colors.grey.shade500,
              onPressed: () {
                togglePassword();
              },
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),

            hintText: label,

            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
          ),
          validator: (value) => passwordValidator(value)),
    );

  
  }

  Widget buildDescriptionField(int lines){

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: x,
      child: TextFormField(
      
        validator: validator,
        controller: controller,
    
        maxLines: lines,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          labelStyle: TextStyle(color: Colors.grey[800], fontSize: 14),
          labelText: label,
            // prefixIcon: prefixWidget,
            filled: true,
            fillColor: 
                  Colors.white,
                 
            hintStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
           enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
            // suffixIcon: suffixWidget
            ),
      ),
    );
  }
}
