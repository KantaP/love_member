import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleSvgAsset extends StatelessWidget{
  final String svgAsset;
  final double width;
  final double height;

  CircleSvgAsset(this.svgAsset, this.width, this.height);

  @override 
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: ClipOval(
          child: SvgPicture.asset(
            svgAsset,
            fit: BoxFit.fill,
          ),
        ),
      );
  }
}