import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

class PopUpDialogSelect extends StatelessWidget {

  final String title;
  final List<S2Choice<String>> items;
  final ValueChanged? onChangeValue;

  const PopUpDialogSelect({Key? key, required this.title, required this.items, this.onChangeValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartSelect<String>.single(
      title: title,
      choiceItems: items,
      onChange: onChangeValue,
      modalType: S2ModalType.popupDialog,
    );
  }
}