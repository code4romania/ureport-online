import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ureport_ecaro/ui/pages/profile/components/popup_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/snackbar_controller.dart';
import '../../shared/general_button_component.dart';
import '../../shared/text_navigator_component.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key, required this.translations});
  final Map<String, String> translations;

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopHeaderWidget(title: translations["header"]!),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextNavigatorComponent(
                title: translations["back"]!,
                onPressed: () => context.router.pop(),
                rightEdge: false,
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  translations["title"]!,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  translations["body"]!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Text(translations["write_message"]!)),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _textController,
                  maxLines: 20,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: MainAppButtonComponent(
                  title: translations["send"]!,
                  onPressed: () {
                    if (_textController.text.isEmpty ||
                        _textController.text.length < 10) {
                      SnackbarController(
                        context: context,
                        message: translations["empty_text"]!,
                      ).show();
                      return;
                    }
                    showDialog(
                        context: context,
                        builder: (context) {
                          return PopupComponent(
                            translations["popup_succes_title"]!,
                            Icons.check,
                            translations["popup_succes_body"]!,
                            buttonText:
                                translations["popup_succes_button_text"]!,
                            onPressed: () => context.router.pop(),
                          );
                        }).then(
                      (value) => context.router.pop(),
                    );
                  },
                ),
              ),
              Spacer(),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: SvgPicture.asset(
                    "assets/images/unicef_about.svg",
                    fit: BoxFit.fill,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
