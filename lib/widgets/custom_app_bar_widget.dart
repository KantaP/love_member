import 'package:boilerplate/constants/base.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomAppBar({Key? key, required this.title, this.leading, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: 
      (leading != null)
      ? leading
      : Builder(
        builder: (BuildContext context) {
          return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop());
        },
      ),
      title: Text(
        title,
        style: Base.navTitle,
      ),
      actions: actions
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(46.0);
}
