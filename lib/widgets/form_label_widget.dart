import 'package:boilerplate/constants/base.dart';
import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {

  final String text;

  const FormLabel({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:16.0),
      child: Text(text, style: Base.s1Text.merge(Base.whiteText)),
    );
  }
}