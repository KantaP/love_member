import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBody extends StatelessWidget {

  final Widget child;

  const CustomBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.bgLogo),
              fit: BoxFit.contain,
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primaryColor[500]!,
                AppColors.primaryColor[900]!
              ],
            ),
          ),
          child: child,
        ),
      );
  }
}