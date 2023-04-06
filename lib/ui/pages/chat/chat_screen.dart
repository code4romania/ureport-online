import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/ui/pages/chat/components/chat_avatar.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/chat-controller.dart';
import '../../../locator/locator.dart';
import '../../../models/firebase_incoming_message.dart';
import '../../../services/click_sound_service.dart';
import '../../../services/database_service.dart';
import '../../../utils/constants.dart';

class Chat extends StatefulWidget {
  String from;

  Chat(this.from);

  @override
  _ChatState createState() => _ChatState(from);
}

class _ChatState extends State<Chat> {
  String from;

  _ChatState(this.from);

  final sendMessageKey = GlobalKey<FormState>();
  TextEditingController _messagecontroller = TextEditingController();
  late FocusNode myFocusNode;

  ScrollController _scrollController = new ScrollController();

  String message = "";

  bool serverStarted = false;

  bool flowStarted = false;

  TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();

  bool isKeyboardOpen = false;

  @override
  void initState() {
    super.initState();
    disableOnScreenPopUp();

    Provider.of<ChatController>(context, listen: false).startMonitoring();
    myFocusNode = FocusNode();

    if (Provider.of<ChatController>(context, listen: false).isLoaded) {
      Provider.of<ChatController>(context, listen: false)
          .getFirebaseInitialMessage();
      Provider.of<ChatController>(context, listen: false).getFirebase();
      Provider.of<ChatController>(context, listen: false)
          .getFirebaseOnApp(context);
      Provider.of<ChatController>(context, listen: false).loadDefaultMessage();
      Provider.of<ChatController>(context, listen: false)
          .deleteMsgAfterFiveDays();
      Provider.of<ChatController>(context, listen: false).isLoaded = false;
      if (from != "notification") {
        Provider.of<ChatController>(context, listen: false).createContact();
      }

      print(SPUtil().getValue(SPUtil.PROGRAMKEY));
    }
  }

  disableOnScreenPopUp() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: false,
      badge: false,
      sound: false,
    );
  }

  DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    String deletedMessageText = "This Message was Deleted";

    return WillPopScope(
      onWillPop: () async {
        Provider.of<ChatController>(context, listen: false).selectall = false;
        ClickSound.soundClose();
        //Detect where this page called
        if (widget.from == "Home") {
          Navigator.pop(context);
        } else {
          context.router.push(RootPageRoute());
        }
        return false;
      },
      child: Consumer<ChatController>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 0.0,
            ),
            body: SafeArea(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
//topbar
                    Container(
                      child: Divider(
                        height: 1,
                        color: Colors.grey[600],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: provider.localmessage.length > 0
                                  ? ListView.builder(
                                      controller: _scrollController,
                                      itemCount:
                                          provider.localmessage.length > 0
                                              ? provider.localmessage.length
                                              : 0,
                                      reverse: true,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        print(provider
                                            .localmessage[index].sender);
                                        return provider.selectall == true &&
                                                provider.localmessage[index]
                                                        .message !=
                                                    "This Message was Deleted"
                                            ?
                                            //after selecting the item..........the view is as following................
                                            GestureDetector(
                                                onTap: () {
                                                  ClickSound.soundClick();
                                                  if (provider.individualselect
                                                      .contains(index)) {
                                                    provider.removeIndex(
                                                      index,
                                                    );
                                                    provider
                                                        .deleteSelectionMessage(
                                                            provider.localmessage[
                                                                index]);
                                                  } else {
                                                    provider.addSelectionItems(
                                                      index,
                                                    );
                                                    provider.addSelectionMessage(
                                                        provider.localmessage[
                                                            index]);
                                                  }
                                                },
                                                child: Row(
                                                  mainAxisAlignment: provider
                                                              .localmessage[
                                                                  index]
                                                              .sender ==
                                                          'server'
                                                      ? MainAxisAlignment.start
                                                      : MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        ClickSound.soundClick();
                                                        if (provider
                                                            .individualselect
                                                            .contains(index)) {
                                                          provider.removeIndex(
                                                            index,
                                                          );
                                                          provider.deleteSelectionMessage(
                                                              provider.localmessage[
                                                                  index]);
                                                        } else {
                                                          provider
                                                              .addSelectionItems(
                                                            index,
                                                          );
                                                          provider.addSelectionMessage(
                                                              provider.localmessage[
                                                                  index]);
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 50,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 10,
                                                                      right: 5),
                                                              child: provider
                                                                      .individualselect
                                                                      .contains(
                                                                          index)
                                                                  ? Container(
                                                                      height:
                                                                          22,
                                                                      width: 22,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(100)),
                                                                        border: Border.all(
                                                                            color: Color.fromRGBO(
                                                                                167,
                                                                                45,
                                                                                111,
                                                                                1)),
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      height:
                                                                          22,
                                                                      width: 22,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(100)),
                                                                        border: Border.all(
                                                                            color: Color.fromRGBO(
                                                                                167,
                                                                                45,
                                                                                111,
                                                                                1)),
                                                                      ),
                                                                    ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    provider.localmessage[index]
                                                                .sender ==
                                                            "server"
                                                        ? ChatAvatar(
                                                            "assets/images/ic_ureport_box.png",
                                                            false)
                                                        : Container(),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: provider
                                                                    .localmessage[
                                                                        index]
                                                                    .sender ==
                                                                'server'
                                                            ? CrossAxisAlignment
                                                                .start
                                                            : CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          provider
                                                                      .localmessage[
                                                                          index]
                                                                      .sender ==
                                                                  'server'
                                                              ? Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              5,
                                                                          right:
                                                                              15,
                                                                          left:
                                                                              15),
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              10),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xffF5FCFF),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child: provider
                                                                              .getLinkClickable(provider.localmessage[index].message!)
                                                                              .length >
                                                                          0
                                                                      ? RichText(
                                                                          text:
                                                                              TextSpan(
                                                                            children: provider
                                                                                .getLinkClickable(provider.localmessage[index].message!)
                                                                                .map(
                                                                                  (data) => data.contains(provider.detectedlink.length > 0 ? provider.detectedlink[0] : "nodata")
                                                                                      ? TextSpan(
                                                                                          text: " $data ",
                                                                                          style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, fontSize: 16),
                                                                                          recognizer: tapGestureRecognizer
                                                                                            ..onTap = () {
                                                                                              String url = provider.detectedlink[0];
                                                                                              launchUrl(Uri.parse(url));
                                                                                            })
                                                                                      : TextSpan(
                                                                                          text: "$data ",
                                                                                          style: TextStyle(color: Colors.black, fontSize: 16),
                                                                                        ),
                                                                                )
                                                                                .toList(),
                                                                          ),
                                                                        )
                                                                      : Text(
                                                                          provider.localmessage[index].message! == deletedMessageText
                                                                              ? "Deleted message"
                                                                              : provider.localmessage[index].message!,
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w400),
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                        ))
                                                              : Container(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              5,
                                                                          right:
                                                                              10,
                                                                          left:
                                                                              15),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        blueColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  child: Text(
                                                                    provider.localmessage[index].message! ==
                                                                            deletedMessageText
                                                                        ? "Deleted message"
                                                                        : provider
                                                                            .localmessage[index]
                                                                            .message!,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .right,
                                                                  ),
                                                                ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          provider.localmessage[index].sender ==
                                                                      "server" &&
                                                                  provider
                                                                          .quicdata(provider
                                                                              .localmessage[
                                                                                  index]
                                                                              .quicktypest
                                                                              .toString())
                                                                          .length >
                                                                      1 &&
                                                                  provider
                                                                      .localmessage[
                                                                          index]
                                                                      .quicktypest
                                                                      .isNotEmpty
                                                              ? ListView
                                                                  .builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      NeverScrollableScrollPhysics(),
                                                                  itemBuilder:
                                                                      (context,
                                                                          j) {
                                                                    return Column(
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            ClickSound.soundMsgSend();
                                                                            DateTime
                                                                                now =
                                                                                DateTime.now();
                                                                            String
                                                                                formattedDate =
                                                                                DateFormat('dd-MM-yyyy hh:mm:ss a').format(now);
                                                                            MessageModel messageModel = MessageModel(
                                                                                message: provider.quicdata(provider.localmessage[index].quicktypest.toString())[j],
                                                                                sender: "user",
                                                                                status: "Sending...",
                                                                                quicktypest: [""],
                                                                                time: formattedDate);
                                                                            provider.addMessage(messageModel);
                                                                            provider.sendMessage(
                                                                              provider.quicdata(provider.localmessage[index].quicktypest.toString())[j].toString(),
                                                                            );
                                                                            messageModel.status =
                                                                                provider.messagestatus;
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                EdgeInsets.all(8),
                                                                            margin:
                                                                                EdgeInsets.only(right: 10),
                                                                            decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                border: Border.all(
                                                                                  color: purpleColor,
                                                                                ),
                                                                                borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                            child: Center(
                                                                                child: Text(
                                                                              "${provider.quicdata(provider.localmessage[index].quicktypest.toString())[j]}",
                                                                              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                                                                            )),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                  itemCount: provider
                                                                      .quicdata(provider
                                                                          .localmessage[
                                                                              index]
                                                                          .quicktypest
                                                                          .toString())
                                                                      .length,
                                                                )
                                                              : Container(),
                                                          SizedBox(
                                                            height: 10,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    provider.localmessage[index]
                                                                .sender ==
                                                            "server"
                                                        ? Container()
                                                        : ChatAvatar(
                                                            "assets/images/ic_user_box.png",
                                                            true),
                                                  ],
                                                ),
                                              )
                                            :

                                            //before select the view is .............as following
                                            GestureDetector(
                                                onLongPress: () {
                                                  ClickSound.soundClick();
                                                  provider.selectall = true;
                                                  provider.individualselect
                                                      .clear();
                                                  // provider.deleteSingleMessage(localmessage.time);
                                                },
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: provider
                                                                  .localmessage[
                                                                      index]
                                                                  .sender ==
                                                              'server'
                                                          ? MainAxisAlignment
                                                              .start
                                                          : MainAxisAlignment
                                                              .end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        provider
                                                                    .localmessage[
                                                                        index]
                                                                    .sender ==
                                                                "server"
                                                            ? ChatAvatar(
                                                                "assets/images/ic_ureport_box.png",
                                                                false)
                                                            : SizedBox(),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment: provider
                                                                        .localmessage[
                                                                            index]
                                                                        .sender ==
                                                                    'server'
                                                                ? CrossAxisAlignment
                                                                    .start
                                                                : CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              provider
                                                                          .localmessage[
                                                                              index]
                                                                          .sender ==
                                                                      'server'
                                                                  ? Container(
                                                                      padding: EdgeInsets.only(
                                                                          top:
                                                                              5,
                                                                          bottom:
                                                                              5,
                                                                          right:
                                                                              15,
                                                                          left:
                                                                              15),
                                                                      margin: EdgeInsets.only(
                                                                          right:
                                                                              10),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: provider.localmessage[index].message ==
                                                                                "This Message was Deleted"
                                                                            ? Colors.grey[300]
                                                                            : Color(0xffF5FCFF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child: provider.localmessage[index].message ==
                                                                              "This Message was Deleted"
                                                                          ? Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Text(
                                                                                  provider.localmessage[index].message! == deletedMessageText ? "Deleted message" : provider.localmessage[index].message!,
                                                                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                                                                                  textAlign: TextAlign.left,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 5,
                                                                                ),
                                                                                Icon(
                                                                                  Icons.not_interested_rounded,
                                                                                  size: 12,
                                                                                  color: Colors.black,
                                                                                ),
                                                                              ],
                                                                            )
                                                                          : provider.getLinkClickable(provider.localmessage[index].message!).length >
                                                                                  0
                                                                              ? RichText(
                                                                                  text: TextSpan(
                                                                                    children: provider
                                                                                        .getLinkClickable(provider.localmessage[index].message!)
                                                                                        .map(
                                                                                          (data) => data.contains(provider.detectedlink.length > 0 ? provider.detectedlink[0] : "nodata")
                                                                                              ? TextSpan(
                                                                                                  text: " $data ",
                                                                                                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, fontSize: 16),
                                                                                                  recognizer: tapGestureRecognizer
                                                                                                    ..onTap = () {
                                                                                                      String url = provider.detectedlink[0];
                                                                                                      launchUrl(Uri.parse(url));
                                                                                                    })
                                                                                              : TextSpan(
                                                                                                  text: "$data ",
                                                                                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                                                                                ),
                                                                                        )
                                                                                        .toList(),
                                                                                  ),
                                                                                )
                                                                              : Text(
                                                                                  provider.localmessage[index].message! == deletedMessageText ? "Deleted message" : provider.localmessage[index].message!,
                                                                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                                                                                  textAlign: TextAlign.left,
                                                                                ))
                                                                  : provider.localmessage[index]
                                                                              .message !=
                                                                          ""
                                                                      ? Container(
                                                                          padding: EdgeInsets.only(
                                                                              top: 5,
                                                                              bottom: 5,
                                                                              right: 10,
                                                                              left: 15),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: provider.localmessage[index].message == "This Message was Deleted"
                                                                                ? Colors.grey[300]
                                                                                : blueColor,
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          child: provider.localmessage[index].message == "This Message was Deleted"
                                                                              ? Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.not_interested_rounded,
                                                                                      size: 12,
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 5,
                                                                                    ),
                                                                                    Text(
                                                                                      provider.localmessage[index].message! == deletedMessageText ? "Deleted message" : provider.localmessage[index].message!,
                                                                                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                                                                                      textAlign: TextAlign.left,
                                                                                    ),
                                                                                  ],
                                                                                )
                                                                              : Text(
                                                                                  provider.localmessage[index].message! == deletedMessageText ? "Deleted message" : provider.localmessage[index].message!,
                                                                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
                                                                                  textAlign: TextAlign.left,
                                                                                ),
                                                                        )
                                                                      : SizedBox(),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              provider.localmessage[index].sender ==
                                                                          "self" ||
                                                                      provider.localmessage[index].sender == "server" &&
                                                                          provider.quicdata(provider.localmessage[index].quicktypest.toString()).length >
                                                                              1 &&
                                                                          provider
                                                                              .localmessage[
                                                                                  index]
                                                                              .quicktypest
                                                                              .isNotEmpty
                                                                  ? ListView
                                                                      .builder(
                                                                      shrinkWrap:
                                                                          true,
                                                                      physics:
                                                                          NeverScrollableScrollPhysics(),
                                                                      itemBuilder:
                                                                          (context,
                                                                              j) {
                                                                        return Column(
                                                                          children: [
                                                                            GestureDetector(
                                                                              onTap: () async {
                                                                                ClickSound.soundMsgSend();
                                                                                DateTime now = DateTime.now();
                                                                                String formattedDate = DateFormat('dd-MM-yyyy hh:mm:ss a').format(now);
                                                                                MessageModel messageModel = MessageModel(message: provider.quicdata(provider.localmessage[index].quicktypest.toString())[j], sender: "user", status: "Sending...", quicktypest: [""], time: formattedDate);

                                                                                List<String> listDefault = [];
                                                                                List<String> listCaseManagement = [];
                                                                                if (listDefault.contains(provider.quicdata(provider.localmessage[index].quicktypest.toString())[j].toString())) {
                                                                                  locator<SPUtil>().setValue(SPUtil.USER_ROLE, "regular");
                                                                                  provider.sendMessage(provider.quicdata(provider.localmessage[index].quicktypest.toString())[j].toString());
                                                                                  List<MessageModel> datalist = [];
                                                                                  datalist.add(messageModel);
                                                                                  await _databaseHelper.insertConversation(datalist, locator<SPUtil>().getValue(SPUtil.PROGRAMKEY));
                                                                                } else if (listCaseManagement.contains(provider.quicdata(provider.localmessage[index].quicktypest.toString())[j].toString())) {
                                                                                  locator<SPUtil>().setValue(SPUtil.USER_ROLE, "caseManagement");
                                                                                  provider.createIndividualCaseManagement(provider.quicdata(provider.localmessage[index].quicktypest.toString())[j].toString());
                                                                                } else {
                                                                                  provider.sendMessage(provider.quicdata(provider.localmessage[index].quicktypest.toString())[j].toString());
                                                                                  List<MessageModel> datalist = [];
                                                                                  datalist.add(messageModel);
                                                                                  await _databaseHelper.insertConversation(datalist, locator<SPUtil>().getValue(SPUtil.PROGRAMKEY));
                                                                                }

                                                                                messageModel.status = provider.messagestatus;
                                                                                provider.replaceQuickReplayData(index, provider.quicdata(provider.localmessage[index].quicktypest.toString())[j]);
                                                                              },
                                                                              child: Container(
                                                                                padding: EdgeInsets.all(8),
                                                                                margin: EdgeInsets.only(right: 10),
                                                                                decoration: BoxDecoration(color: Colors.white, border: Border.all(color: purpleColor), borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  "${provider.quicdata(provider.localmessage[index].quicktypest.toString())[j]}",
                                                                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                                                                                )),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                      itemCount: provider
                                                                          .quicdata(provider
                                                                              .localmessage[index]
                                                                              .quicktypest
                                                                              .toString())
                                                                          .length,
                                                                    )
                                                                  : Container(),
                                                              SizedBox(
                                                                height: 10,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        provider
                                                                        .localmessage[
                                                                            index]
                                                                        .sender ==
                                                                    "self" ||
                                                                provider
                                                                        .localmessage[
                                                                            index]
                                                                        .sender ==
                                                                    "server"
                                                            ? SizedBox()
                                                            : ChatAvatar(
                                                                "assets/images/ic_user_box.png",
                                                                true),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                      },
                                    )
                                  : Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          provider.firstMessageStatus() == true
                                              ? Container(
                                                  // padding: EdgeInsets.only(
                                                  //     left: 12,
                                                  //     right: 12,
                                                  //     top: 5,
                                                  //     bottom: 5),
                                                  // decoration: BoxDecoration(
                                                  //     color: Color(0xffCCCCCC),
                                                  //     borderRadius:
                                                  //         BorderRadius.all(
                                                  //             Radius.circular(
                                                  //                 20))),
                                                  // child: Row(
                                                  //   mainAxisSize:
                                                  //       MainAxisSize.min,
                                                  //   children: [
                                                  //     Icon(
                                                  //       Icons
                                                  //           .not_interested_rounded,
                                                  //       size: 12,
                                                  //       color: Colors.black,
                                                  //     ),
                                                  //     SizedBox(
                                                  //       width: 5,
                                                  //     ),
                                                  //     Text(
                                                  //       AppLocalizations.of(
                                                  //               context)!
                                                  //           .previous_message_deleted,
                                                  //       style: TextStyle(
                                                  //           color: Colors.black,
                                                  //           fontSize: 16,
                                                  //           fontWeight:
                                                  //               FontWeight
                                                  //                   .w500),
                                                  //       textAlign:
                                                  //           TextAlign.left,
                                                  //     ),
                                                  //   ],
                                                  // ),
                                                  )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                          provider.isMessageCome == true
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ChatAvatar(
                                        "assets/images/ic_ureport_box.png",
                                        false),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset(
                                      'assets/gifs/chat_loading.gif',
                                      height: 20,
                                      width: 40,
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 10,
                          ),
                          !provider.isOnline
                              ? Container(
                                  height: 40,
                                  padding: EdgeInsets.only(left: 25),
                                  width: double.infinity,
                                  color: Colors.black87,
                                  child: Row(
                                    children: [
                                      Text(
                                        "NO internet connection",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                          Container(
                            width: double.infinity,
                            height: 64,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.only(left: 0, right: 3),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: provider.selectall == true
                                        ? Container(
                                            height: 120,
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                provider.individualselect
                                                            .length >
                                                        0
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          ClickSound
                                                              .soundClick();
                                                          deleteMessageDialog(
                                                              provider);
                                                        },
                                                        child: Container(
                                                          width: 70,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Icon(
                                                                Icons.delete,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : SizedBox(
                                                        width: 70,
                                                      ),
                                                Spacer(),
                                                Text(
                                                  "${provider.individualselect.length} selected",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16),
                                                ),
                                                Spacer(),
                                                GestureDetector(
                                                    onTap: () {
                                                      ClickSound.soundClick();
                                                      provider.selectall =
                                                          false;
                                                      provider.selectedMessage
                                                          .clear();
                                                      provider.individualselect
                                                          .clear();
                                                    },
                                                    child: Container(
                                                      width: 70,
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15),
                                                      ),
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          )
                                        : sendMessage(context, provider),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  deleteMessageDialog(ChatController provider) {
    AlertDialog alert = AlertDialog(
      content: Text("Delete message"),
      actions: [
        TextButton(
          child: Text(
            "Delete",
            style: TextStyle(color: purpleColor),
          ),
          onPressed: () {
            ClickSound.soundClick();
            provider.deleteMessage();
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text("Cancel"),
          onPressed: () {
            ClickSound.soundClick();
            Provider.of<ChatController>(context, listen: false).selectall =
                false;
            Navigator.pop(context);
          },
        )
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget sendMessage(context, provider) {
    var providers = Provider.of<ChatController>(context, listen: false);
    return Container(
      height: 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: sendMessageKey,
            child: Row(
              children: [
                provider.isExpanded == true || isKeyboardOpen == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          false
                              ? GestureDetector(
                                  onTap: () {
                                    if (provider.isOnline) {
                                      ClickSound.soundMsgSend();
                                      provider.addQuickType();
                                      provider.isExpanded = false;
                                      _scrollController.animateTo(0.0,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeOut);
                                    } else {
                                      // ShowSnackBar.showNoInternetMessageChat(context);
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(4),
                                    height: 40,
                                    width: 30,
                                    child: Image.asset(
                                      "assets/images/ic_chat_menu.png",
                                    ),
                                  ),
                                )
                              : SizedBox(),
                          false
                              ? SizedBox(
                                  width: 10,
                                )
                              : SizedBox(),
                          false
                              ? GestureDetector(
                                  onTap: () {
                                    if (provider.isOnline) {
                                      ClickSound.soundMsgSend();
                                      provider.addQuickTypeCaseManagement();
                                      provider.isExpanded = false;
                                      _scrollController.animateTo(0.0,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeOut);
                                    } else {
                                      // ShowSnackBar.showNoInternetMessageChat(context);
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(3.5),
                                    height: 40,
                                    width: 30,
                                    child: Image.asset(
                                      "assets/images/ic_one_to_one_chat.png",
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      )
                    : false
                        ? GestureDetector(
                            onTap: () {
                              provider.isExpanded = true;
                              // provider.addQuickType();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              padding: EdgeInsets.all(4),
                              child: Image.asset(
                                "assets/images/ic_arrow_chat.png",
                              ),
                            ),
                          )
                        : Container() /*:SizedBox()*/,
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(),
                    child: TextFormField(
                      controller: _messagecontroller,
                      focusNode: myFocusNode,
                      onChanged: (String value) {
                        message = value;
                        myFocusNode.requestFocus();
                      },
                      decoration: InputDecoration.collapsed(
                          hintText: "Mesaj",
                          hintStyle: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset("assets/images/ic_sand.png"),
                      onPressed: () {
                        if (provider.isOnline) {
                          ClickSound.soundMsgSend();
                          DateTime now = DateTime.now();
                          String formattedDate =
                              DateFormat('dd-MM-yyyy hh:mm:ss a').format(now);
                          sendMessageKey.currentState!.save();
                          if (message == "") return;
                          final messageModel = MessageModel(
                              message: message,
                              sender: "user",
                              status: "Sending...",
                              quicktypest: [""],
                              time: formattedDate);
                          provider.addMessage(messageModel);
                          List<String> listDefault = [];
                          List<String> listCaseManagement = [];
                          print("listDefault $listDefault");
                          print("listCaseManagement $listCaseManagement");
                          if (listDefault.contains(message)) {
                            locator<SPUtil>()
                                .setValue(SPUtil.USER_ROLE, "regular");
                          } else if (listCaseManagement.contains(message)) {
                            locator<SPUtil>()
                                .setValue(SPUtil.USER_ROLE, "caseManagement");
                          }

                          providers.sendMessage(message);

                          messageModel.status = provider.messagestatus;
                          _messagecontroller.clear();
                          message = "";

                          setState(() {
                            myFocusNode.requestFocus();
                          });
                        } else {
                          // ShowSnackBar.showNoInternetMessageChat(context);
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showNoInternetDialog() {
    Timer(Duration(seconds: 1), () {
      if (!Provider.of<ChatController>(context, listen: false).isOnline) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("No internet"),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      }
    });
  }
}
