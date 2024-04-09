import 'package:flutter/material.dart';

class UiHelper{

  CustomTextField(TextEditingController controller,Text Label){
   return TextField(
     controller: controller,
     decoration: InputDecoration(
       label: Label,
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(8)
       )
     ),
   );
  }


}