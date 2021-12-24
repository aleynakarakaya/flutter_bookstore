// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class LabelTextWidget extends StatefulWidget {
  final String degisken;

  const LabelTextWidget({Key? key, required this.degisken}) : super(key: key);

  @override
  _LabelTextWidgetState createState() => _LabelTextWidgetState();
}

class _LabelTextWidgetState extends State<LabelTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: widget.degisken,
            labelStyle: TextStyle(
                color: Color.fromRGBO(173, 183, 192, 1),
                fontWeight: FontWeight.bold),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(173, 183, 192, 1)),
            ),
          ),
        ),
      ],
    );
  }
}
