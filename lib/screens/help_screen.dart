import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoonMall/custom/input_decorations.dart';
import 'package:zoonMall/custom/intl_phone_input.dart';

import '../my_theme.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  TextEditingController _emailController = TextEditingController();
  PhoneNumber phoneCode = PhoneNumber(isoCode: 'EG', dialCode: "+20");
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  String _phone = "";

  bool messageSent = false;
  final GlobalKey<ScaffoldState> _scaffoldstate =
      new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldstate.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.phone),
        onPressed: () {
          launch("tel://201000000000");
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Let us call you :',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                "Name",
                style: TextStyle(
                    color: MyTheme.accent_color, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                height: 36,
                child: TextField(
                  controller: _nameController,
                  autofocus: false,
                  decoration: InputDecorations.buildInputDecoration_1(
                      hint_text: "John Doe"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                "Email",
                style: TextStyle(
                    color: MyTheme.accent_color, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 36,
              child: TextField(
                controller: _emailController,
                autofocus: false,
                decoration: InputDecorations.buildInputDecoration_1(
                    hint_text: "johndoe@example.com"),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                "Phone Number",
                style: TextStyle(
                    color: MyTheme.accent_color, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 36,
              child: CustomInternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                  setState(() {
                    _phone = number.phoneNumber;
                  });
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: MyTheme.font_grey),
                initialValue: phoneCode,
                textFieldController: _phoneNumberController,
                formatInput: true,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputDecoration: InputDecorations.buildInputDecoration_phone(
                    hint_text: "01710 333 558"),
                onSaved: (PhoneNumber number) {
                  //print('On Saved: $number');
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FlatButton(
              minWidth: MediaQuery.of(context).size.width,
              //height: 50,
              color: MyTheme.accent_color,
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              child: Text(
                "Send Request",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                // showInSnackBar("We will call back you soon");
                setState(() {
                  messageSent = true;
                });
              },
            ),
            SizedBox(
              height: 16,
            ),
            messageSent
                ? Text(
                    'Thank you , We will call back you soon',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.accent_color),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
