import 'package:boilerplate/constants/base.dart';
import 'package:flutter/material.dart';

class BoxInput extends StatelessWidget {
  final double width;
  final double height;
  final ValueChanged? onChange;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextEditingController? controller;

  const BoxInput(
      {Key? key,
      required this.width,
      required this.height,
      this.onChange,
      required this.padding,
      this.controller, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(color: Colors.white , borderRadius: BorderRadius.circular(5.0),),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        style: Base.b1Text,
        decoration: InputDecoration(border: InputBorder.none),
        maxLength: 1,
        textAlign: TextAlign.center,
        buildCounter: (BuildContext context, { int? currentLength, int? maxLength, bool? isFocused }) => null,
      ),
    );
  }
}
