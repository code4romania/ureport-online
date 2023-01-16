import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/data/secure_storage.dart';
import 'package:ureport_ecaro/utils/click_sound.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ureport_ecaro/utils/constants.dart';
import 'package:ureport_ecaro/utils/resources.dart';
import 'package:ureport_ecaro/view_model/state_store.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var _dropdownValue = "English";

  late StateStore _state;

  @override
  void initState() {
    /*
  'English' en,
  '中國人' zh,
  'Español' es,
  'Français' fr,
  'Romanian' ro,
  'русский' ru,
  'Italiano' it,
  'عربي' ar,                                       
    */

    _state = context.read<StateStore>();

    switch (_state.locale?.countryCode) {
      case 'en':
        _dropdownValue = "English";
        break;
      case 'ro':
        _dropdownValue = "Romanian";
        break;
      case 'zh':
        _dropdownValue = "中國人";
        break;
      case 'es':
        _dropdownValue = "Español";
        break;
      case 'fr':
        _dropdownValue = "Français";
        break;
      case 'it':
        _dropdownValue = "Italiano";
        break;
      case 'ru':
        _dropdownValue = "русский";
        break;
      case 'ar':
        _dropdownValue = "عربي";
        break;
      default:
        _dropdownValue = "English";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBgColor,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 50),
                        height: 55,
                        width: 170,
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/v2_logo_1.png"),
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: AppLocalizations.of(context)!.welcome,
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black,
                                      fontFamily: "Poppins")),
                              TextSpan(
                                  text:
                                      "\n${AppLocalizations.of(context)!.get_started}",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontFamily: "Poppins")),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            "${AppLocalizations.of(context)?.select_language ?? "Select language"}",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _dropdownValue,
                                  iconSize: 24,
                                  elevation: 16,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  onChanged: (String? newValue) {
                                    ClickSound.soundClick();

                                    _dropdownValue = newValue!;
                                    if (_dropdownValue == "English") {
                                      _state.setLocale(new Locale('en'));
                                    } else if (_dropdownValue == "中國人") {
                                      _state.setLocale(new Locale('zh'));
                                    } else if (_dropdownValue == "Français") {
                                      _state.setLocale(Locale('fr'));
                                    } else if (_dropdownValue == "Romanian") {
                                      _state.setLocale(Locale('ro'));
                                    } else if (_dropdownValue == "русский") {
                                      _state.setLocale(Locale('ru'));
                                    } else if (_dropdownValue == "Español") {
                                      _state.setLocale(Locale('es'));
                                    } else if (_dropdownValue == "عربي") {
                                      _state.setLocale(Locale('ar'));
                                    } else if (_dropdownValue == "Italiano") {
                                      _state.setLocale(Locale('it'));
                                    } else {
                                      _state.setLocale(Locale('en'));
                                    }
                                    setState(() {});
                                  },
                                  items: <String>[
                                    'English',
                                    '中國人',
                                    'Español',
                                    'Français',
                                    'Romanian',
                                    'русский',
                                    'Italiano',
                                    'عربي',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      onTap: () {},
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onTap: () {
                                    ClickSound.soundDropdown();
                                  },
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 70),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: Container(
                          child: GestureDetector(
                        onTap: () {
                          ClickSound.soundClick();

                          StorageUtil.putString(
                              "SELECTED_LANGUAGE", _state.locale!.languageCode);

                          //TODO: GOTO INTRO SCREEN
                          // NavUtils.pushAndRemoveUntil(context, IntroScreen());
                        },
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.continu,
                            style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
