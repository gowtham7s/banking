import 'dart:ffi';

import 'package:flutter/material.dart';
import '../helpers/helpers.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.title, required this.placeholder, required  this.onSubmit, required  this.onChanged, required this.keyboardType, String errorText = ""});

  final String title;
  final String placeholder;
  final String errorText = "";
  Function(String) onSubmit;
  Function(String) onChanged;
  TextInputType keyboardType = TextInputType.number;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: HexColor("4e5f74"), fontWeight: FontWeight.normal, fontSize: 16),),

        const SizedBox(height: 8,),

        SizedBox(
          //height: 50,
          child: TextField(
            keyboardType: keyboardType,
            onSubmitted: onSubmit,
            onChanged: onChanged,
            cursorColor: HexColor("0c2340"),
            style: TextStyle(color: HexColor("0c2340"), fontWeight: FontWeight.normal, fontSize: 16),
            decoration: InputDecoration(
              filled: true,
              fillColor: HexColor("f5f6f8"),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
              ),
              hintText: placeholder,
              errorText: errorText.isEmpty ? null : errorText,
            ),
          ),
        )
      ],
    );
  }
}

class CustomPrefixedTextField extends StatelessWidget {
  CustomPrefixedTextField({super.key, required this.title, required this.placeholder, required  this.onSubmit, required this.maxLimit, required this.onChanged, required this.prefix, bool? isAmount, double? spaceBetween, required this.isAmountField});

  final String title;
  final String placeholder;
  final String prefix;
  Function(String) onSubmit;
  Function(String) onChanged;
  final int maxLimit;
  final TextInputType keyboardType = TextInputType.number;
  final bool isAmountField;
  final double spaceBetween = 8;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: HexColor("4e5f74"), fontWeight: FontWeight.normal, fontSize: 16),),

        SizedBox(height: spaceBetween,),

        SizedBox(
          height: 50,
          child: TextField(
            onSubmitted: onSubmit,
            onChanged: onChanged,
            inputFormatters: isAmountField ? [ThousandsSeparatorInputFormatter()] : null,
            maxLength: maxLimit,
            keyboardType: keyboardType,
            cursorColor: HexColor("0c2340"),
            style: TextStyle(color: HexColor("0c2340"), fontWeight: FontWeight.normal, fontSize: 16),
            decoration: InputDecoration(
              //errorText: "Please enter value",
              counterText: "",
              hintText: placeholder,
              isDense: true,
              prefixIcon:Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: 80,
                //color: Colors.red,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(prefix, style: TextStyle(color: HexColor("0c2340"), fontWeight: FontWeight.normal, fontSize: 16),),
                      Spacer(),
                      Container(padding: EdgeInsets.symmetric(horizontal: 10),width: 1, color: HexColor("d3d7de"), height: 28,),
                    ],
                  ),
                ),
              ),
              //prefixIconConstraints: BoxConstraints(minWidth: 20, minHeight: 0),
              //prefixText: "UAE",
              filled: true,
              fillColor: HexColor("f5f6f8"),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
              ),
              errorBorder:  OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
              ),
            ),
          ),
        )
      ],
    );
  }
}


class CustomDropDown extends StatelessWidget {
  CustomDropDown({super.key, required this.title, required this.placeholder, required  this.listItem, required this.onPressed});

  final String title;
  final String placeholder;
  List<String> listItem; // ["Employed", "Self Employed", "Government", "Pensioner"]
  Function(String?) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: HexColor("4e5f74"), fontWeight: FontWeight.normal, fontSize: 16),),

        const SizedBox(height: 8,),

        SizedBox(
          height: 50,
          child: DropdownButtonFormField(
            hint: Text(placeholder),
            isExpanded: true,
            isDense: false,
            itemHeight: 50,
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              border: OutlineInputBorder( ),
              filled: true,
              fillColor: HexColor("f5f6f8"),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
              ),
              errorBorder:  OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
              ),
            ), onChanged: onPressed, items: listItem.map((itemOne){
            return DropdownMenuItem(
              value: itemOne,
              child: Text(itemOne),
            );
          }).toList(),
          ),
        ),
      ],
    );
  }
}