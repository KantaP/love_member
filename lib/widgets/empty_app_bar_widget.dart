import 'package:boilerplate/constants/colors.dart';
import 'package:flutter/material.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor[500]!,
    );
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}
