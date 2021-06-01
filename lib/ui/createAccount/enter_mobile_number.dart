import 'package:boilerplate/constants/base.dart';
import 'package:boilerplate/stores/form/form_store.dart';
import 'package:boilerplate/widgets/box_input_widget.dart';
import 'package:boilerplate/widgets/custom_app_bar_widget.dart';
import 'package:boilerplate/widgets/custom_body_widget.dart';
import 'package:boilerplate/widgets/form_label_widget.dart';
import 'package:boilerplate/widgets/mobile_number_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateMobileNumberPage extends StatefulWidget {
  @override
  _CreateMobileNumberPageState createState() => _CreateMobileNumberPageState();
}

class _CreateMobileNumberPageState extends State<CreateMobileNumberPage> {
  //controller:-----------------------------------------------------------------
  TextEditingController _mobileNumberFieldController = TextEditingController();

  //stores:---------------------------------------------------------------------
  final _store = FormStore();

  //General
  final String refCode = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Create Account', //translate
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Center(
              child: Text(
                '1/3',
                style: Base.h5Text.merge(Base.navTitle),
              ),
            ),
          )
        ],
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return CustomBody(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _mobileNumberInput(),
            _verifyMobileNumber(),
            _trouble()
          ],
        ),
      ),
    );
  }

  Widget _mobileNumberInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 52, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormLabel(text: 'Mobile number'), //translate
          Observer(builder: (BuildContext context) {
            return _mobileFormField();
          }),
        ],
      ),
    );
  }

  Widget _verifyMobileNumber() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 32, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormLabel(text: 'Verify mobile number'),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Enter your 4 digits OTP you get from message\nref code : $refCode',
              style: Base.s2Text.merge(Base.whiteText),
            ),
          ),
          _verifyFormField()
        ],
      ),
    );
  }

  Widget _trouble() {
    return Container();
  }

  Widget _verifyFormField() {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _generateVerifyInput(),
      ),
    );
  }

  List<Widget> _generateVerifyInput() {
    final double sizeWidth = 74.0;
    final double sizeHeight = 56.0;
    final EdgeInsets padding = EdgeInsets.all(10.0);
    final EdgeInsets margin = EdgeInsets.all(8.0);
    final List<Widget> inputs = [
      BoxInput(
        width: sizeWidth,
        height: sizeHeight,
        padding: padding,
        margin: margin
      ),
      BoxInput(
        width: sizeWidth,
        height: sizeHeight,
        padding: padding,
        margin: margin
      ),
      BoxInput(
        width: sizeWidth,
        height: sizeHeight,
        padding: padding,
        margin: margin
      ),
      BoxInput(
        width: sizeWidth,
        height: sizeHeight,
        padding: padding,
        margin: margin
      ),
    ];
    return inputs;
  }

  Widget _mobileFormField() {
    return MobileNumberField(
      hint: 'Mobile number',
      errorText: '', //translate
      textController: _mobileNumberFieldController,
    );
  }
}
