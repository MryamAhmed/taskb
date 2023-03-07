import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defultButton({

  double height =40,
  Color background = Colors.deepOrange,
  double width = double.infinity,
  required String text,
  VoidCallback?ontap

}) =>Container(
  height: height,
  color: background,
  width: width,
  child: GestureDetector(
    onTap: ontap,
    child: Text(text,
      style: TextStyle(
          color: Colors.white
      ),
    ),
  ),
);




Widget defultTextFeild ({
   TextEditingController? controller,
  required TextInputType  type,
  required String label,
  required IconData prefix,
  required var validate,
  bool isPasswordd = false,
  IconData? suffix,
  var suffixPressed,
  var onchange

}) => TextFormField(

  onChanged:onchange ,
  controller: controller,
  keyboardType:type,
  obscureText: isPasswordd,
  decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
      prefixIcon: Icon(
          prefix
      ),


      suffixIcon: suffix !=null ? IconButton(
        onPressed:suffixPressed,
        icon:Icon(
            suffix
        ),
      ) : null

  ),

  validator: validate,

);


Widget defultsecssion ({
  required String text,
  required Color background ,
}) => Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(12)
                ),

                child: Center(
                    child:
                    Text(text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),)
                ),
              ),
            ),

          ),
        ],
      ),
    );