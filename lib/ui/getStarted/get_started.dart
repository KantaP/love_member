import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/base.dart';
import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/app_icon_widget.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:boilerplate/widgets/langauge_popup_dialog_widget.dart';
import 'package:boilerplate/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatefulWidget {
  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
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
            colors: <Color>[
              AppColors.primaryColor[500]!,
              AppColors.primaryColor[900]!
            ],
          ),
        ),
        child: Center(
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _buildAppLogo(),
              _buildDescriptionText(),
              SizedBox(height: 18.2),
              _buildGetStartedButton(),
              SizedBox(
                height: 31.0,
              ),
              _buildSkipToSignIn(),
            ],
          ),
        ),
        _buildFooter(),
      ],
    );
  }

  Widget _buildAppLogo() {
    double topPadding = MediaQuery.of(context).size.height * 0.15;
    return Padding(
        padding: EdgeInsets.only(top: topPadding ),
        child: AppIconWidget(image: Assets.appLogo),
      );
  }

  Widget _buildDescriptionText() {
    double topPadding = MediaQuery.of(context).size.height * 0.2;
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: SizedBox(
        width: 280.0,
        child: Text(
          AppLocalizations.of(context).translate('get_started_description_text'),
          textAlign: TextAlign.center,
          style: Base.descriptionText,
        ),
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return RoundedButtonWidget(
      buttonText:
          AppLocalizations.of(context).translate('get_started_button_text'),
      buttonColor: AppColors.primaryColor[500]!,
      buttonSide: BorderSide(
        width: 1.0,
        color: Colors.white,
        style: BorderStyle.solid,
      ),
      onPressed: () {
        Navigator.pushNamed(context, Routes.termsAndConditions);
      },
    );
  }

  Widget _buildSkipToSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            AppLocalizations.of(context)
                .translate('get_started_sign_in_description'),
            style: Base.descriptionText),
        TextButton(
          style: Base.primaryTextButton.merge(
            TextButton.styleFrom(
              padding: EdgeInsets.only(left: 4.0),
            ),
          ),
          child: Text(
            AppLocalizations.of(context)
                .translate('get_started_sign_in_button_text'),
            style: Base.linkText,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Positioned(
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
        ),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: _buildSmartSelect(),
      ),
    );
  }

  Widget _buildSmartSelect() {
    return LangaugePopUpDialog(
      title: AppLocalizations.of(context)
                    .translate('get_started_change_lang_text'),
    );
  }
}
