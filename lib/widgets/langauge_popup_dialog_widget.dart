import 'package:boilerplate/constants/base.dart';
import 'package:boilerplate/constants/smart_select_choices.dart';
import 'package:boilerplate/stores/language/language_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';
// ignore: implementation_imports
import 'package:smart_select/src/model/chosen.dart';

class LangaugePopUpDialog extends StatefulWidget {
  final String title;

  const LangaugePopUpDialog({Key? key, required this.title}) : super(key: key);

  @override
  _LangaugePopUpDialogState createState() => _LangaugePopUpDialogState();
}

class _LangaugePopUpDialogState extends State<LangaugePopUpDialog> {
  late LanguageStore _languageStore;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SmartSelect<String?>.single(
      title: widget.title,
      choiceItems: langChoice,
      selectedValue: (_languageStore.getCurrentLanguage == null) ? 'en' : _languageStore.getCurrentLanguage,
      onChange: (S2SingleSelected<String?> selected) =>
          _languageStore.changeLanguage(selected.value!),
      modalType: S2ModalType.popupDialog,
      tileBuilder: (BuildContext context, S2SingleState<String?> state) {
        return S2Tile.fromState(
          state,
          title: Text(state.title! , style: Base.descriptionText),
          value: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset(
                    'icons/flags/png/${flagImage(state.selected!.choice!.value!)}',
                    package: 'country_icons',
                    width: 24,
                    height: 24,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Text(state.selected!.choice!.title!, style: Base.descriptionText,)
            ],
          ),
          trailing: const Icon(Icons.keyboard_arrow_down, color:  Colors.white),
        );
      },
    );
  }
}

String flagImage(String value) {
  if (value == 'en') {
    return 'gb.png';
  }
  if (value == 'da') {
    return 'de.png';
  }
  return '$value.png';
}
