import 'package:boilerplate/constants/base.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color? textColor;
  final VoidCallback onPressed;
  final BorderSide? buttonSide;
  final Icon? icon;

  const RoundedButtonWidget({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    this.textColor = Colors.white,
    required this.onPressed,
    this.buttonSide,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.buttonHeight,
      width: Dimens.buttonWidth,
      child: ElevatedButton(
        style: Base.primaryElevacatedButton.merge(
          ElevatedButton.styleFrom(
            primary: buttonColor,
            side: buttonSide,
          ),
        ),
        onPressed: onPressed,
        child: (icon != null)
            ? Stack(fit: StackFit.expand, children: [
                Align(
                  child: Text(
                    buttonText,
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: textColor),
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  child: icon,
                  alignment: Alignment.centerRight,
                )
              ])
            : Text(
                buttonText,
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(color: textColor),
              ),
      ),
    );
  }
}
