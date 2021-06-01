import 'package:boilerplate/constants/base.dart';
import 'package:flutter/material.dart';

class MobileNumberField extends StatelessWidget {
  final String? hint;
  final String? errorText;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        autofocus: autoFocus,
        textInputAction: inputAction,
        maxLength: 25,
        obscureText: false,
        keyboardType: TextInputType.phone,
        style: Base.b1Text,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: this.hint,
          hintStyle: Base.b1Text,
          errorText: errorText,
          counterText: '',
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          prefixIcon: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(shape: BoxShape.circle),
            padding: EdgeInsets.fromLTRB(12, 12, 8, 12),
            child: ClipOval(
              child: Image.asset(
                'icons/flags/png/th.png',
                package: 'country_icons',
                width: 24,
                height: 24,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // icon: this.isIcon ? Icon(this.icon, color: iconColor) : null,
        ),
      ),
    );
  }

  const MobileNumberField({
    Key? key,
    required this.errorText,
    required this.textController,
    this.hint,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.inputAction,
  }) : super(key: key);
}
