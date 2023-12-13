// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tubes_smart_home/components/_components.dart';

class MyTextFieldCustom extends StatelessWidget {
  MyTextFieldCustom({
    super.key,
    this.controller,
    required this.textFieldTitle,
    this.hintText,
    this.hintField = '',
    this.readOnly = false,
    this.validator,
  });

  TextEditingController? controller;
  final String textFieldTitle;
  String? hintText;
  String hintField;
  bool readOnly;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                textFieldTitle,
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              if (hintField != '')
                Text(
                  hintField,
                  style: TextStyle(
                    color: red,
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            readOnly: readOnly,
            obscureText: false,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 18,
              ),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: darkOrange, width: 2.0),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: darkOrange, width: 1.0),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: darkOrange, width: 2.0),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: red, width: 1.0),
                borderRadius: BorderRadius.circular(15),
              ),
              errorStyle: TextStyle(
                color: red,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
