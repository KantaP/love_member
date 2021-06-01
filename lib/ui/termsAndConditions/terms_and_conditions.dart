import 'package:boilerplate/constants/base.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatefulWidget {
  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context).translate('terms_and_conditions_title_nav'),),
      body: _buildContent(),
      persistentFooterButtons: <Widget>[
        Container(
          width: MediaQuery.of(context).copyWith().size.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAcceptButton()
            ],
          ),
        )
      ],
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.fromLTRB(27, 48, 27, 48),
      child: SingleChildScrollView(
        child: Text(
          AppLocalizations.of(context)
              .translate('terms_and_conditions_content'),
          style: Base.b2Text,
        ),
      ),
    );
  }

  Widget _buildAcceptButton() {
    return RoundedButtonWidget(
      buttonText:
          AppLocalizations.of(context).translate('terms_and_conditions_accept_button_text'),
      buttonColor: AppColors.primaryColor[500]!,
      buttonSide: BorderSide(
        width: 1.0,
        color: Colors.white,
        style: BorderStyle.solid,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.createStep1);
      },
      icon: Icon(Icons.arrow_forward_outlined),
    );
  }
}
