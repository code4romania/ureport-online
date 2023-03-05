import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ureport_ecaro/services/click_sound_service.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/constants.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
import '../../shared/text_navigator_component.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.translations});
  final Map<String, String> translations;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  late bool _notificationsActive;
  late bool _soundClickActive;

  @override
  void initState() {
    _notificationsActive =
        SPUtil().getValue(SPUtil.KEY_USER_NOTIFICATIONS) == "true";
    _soundClickActive = SPUtil().getValue(SPUtil.SOUND) == "true";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopHeaderWidget(title: widget.translations["header"]!),
          TextNavigatorComponent(
            title: widget.translations["back"]!,
            onPressed: () => context.router.pop(),
            rightEdge: false,
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            child: Text(
              widget.translations["title"]!,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              widget.translations["body"]!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 90,
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: blueColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(widget.translations["mobile"]!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.volume_down,
                        size: 28,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "On/Off",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  CupertinoSwitch(
                    value: _notificationsActive,
                    activeColor: Color.fromRGBO(159, 75, 152, 1),
                    onChanged: (value) {
                      setState(() {
                        ClickSound.soundDropdown();
                        _notificationsActive = value;
                        SPUtil().setValue(
                            SPUtil.KEY_USER_NOTIFICATIONS, value.toString());
                      });
                    },
                  ),
                ],
              ),
            ]),
          ),
          Container(
            height: 90,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: blueColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(widget.translations["sound"]!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.volume_down,
                        size: 28,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "On/Off",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  CupertinoSwitch(
                    value: _soundClickActive,
                    activeColor: Color.fromRGBO(159, 75, 152, 1),
                    onChanged: (value) {
                      ClickSound.soundDropdown();
                      setState(() {
                        _soundClickActive = value;
                        SPUtil().setValue(SPUtil.SOUND, value.toString());
                      });
                    },
                  ),
                ],
              ),
            ]),
          ),
          Spacer(),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/unicef_about.png",
                fit: BoxFit.fill,
              ))
        ],
      ),
    );
  }
}
