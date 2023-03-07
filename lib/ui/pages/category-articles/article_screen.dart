import 'dart:async';
import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/controllers/story_store.dart';
import 'package:ureport_ecaro/models/story.dart';
import 'package:ureport_ecaro/models/story_long.dart';
import 'package:ureport_ecaro/services/click_sound_service.dart';
import 'package:ureport_ecaro/services/story_service.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/finish_reading_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import 'package:ureport_ecaro/ui/shared/text_navigator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
import 'package:ureport_ecaro/utils/translation.dart';
import '../../../utils/constants.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class ArticleScreen extends StatefulWidget {
  ArticleScreen({
    Key? key,
    this.storyId,
    this.preloadedStory,
    required this.isComingFromHome,
  }) : super(key: key);

  final int? storyId;
  final StoryItem? preloadedStory;
  final bool isComingFromHome;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  late WebViewPlusController webViewController;
  late StateStore _stateStore;
  late StoryStore _storyStore;
  late ScrollController _scrollController;
  late Map<String, String> _translation;

  double webViewHeight = 0;
  bool _showScrollToTop = true;

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (_storyStore.readArticle || _storyStore.timer != null) {
        _storyStore.finishReading();
        _scrollController.removeListener(_scrollListener);
      }
    }
  }

  @override
  void initState() {
    final spUtil = SPUtil();

    _scrollController = ScrollController();
    _stateStore = context.read<StateStore>();
    _translation =
        translations["${_stateStore.selectedLanguage}"]!["article_screen"]!;

    if (!widget.isComingFromHome) {
      _storyStore = StoryStore(
        widget.storyId!,
        null,
        spUtil,
      );
      _storyStore.fetchStory(widget.storyId!);
    } else {
      _storyStore = StoryStore(
        widget.preloadedStory!.id!,
        widget.preloadedStory!,
        spUtil,
      );
    }

    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    _storyStore.cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _showScrollToTop
          ? GestureDetector(
              onTap: _scrollToTop,
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.asset("assets/images/arrow_up_rectangular.png")),
            )
          : SizedBox(),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              TopHeaderWidget(title: _translation["header"]!),
              TextNavigatorComponent(
                title: _translation["back"]!,
                rightEdge: false,
                onPressed: () => context.router.pop(),
              ),
              SizedBox(
                height: 20,
              ),
              if (!widget.isComingFromHome)
                fetchedArticle()
              else
                preloadedArticle()
            ],
          ),
        ),
      ),
    );
  }

  Widget preloadedArticle() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: Color.fromRGBO(201, 13, 182, 1),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.preloadedStory!.category!.name!.split('/')[1].trim(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      ClickSound.soundClick();

                      if (_storyStore.isBookmarked) {
                        _storyStore.removeBookmark(
                          storyId: widget.preloadedStory!.id!,
                        );
                      } else {
                        _storyStore.addBookmark(
                          storyId: widget.preloadedStory!.id!,
                        );
                      }

                      // call api to bookmark story
                    },
                    child: Observer(builder: (context) {
                      return Icon(
                        _storyStore.isBookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_border_outlined,
                        color: purpleColor,
                        size: 30,
                      );
                    }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      ClickSound.soundShare();
                      Share.share(
                          shareStoryUrl +
                              "/" +
                              widget.preloadedStory!.id.toString(),
                          subject: widget.preloadedStory!.title.toString());
                    },
                    child: Icon(
                      Icons.share_outlined,
                      color: purpleColor,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Text(
            widget.preloadedStory!.title.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 20, right: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _translation["author"]!,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: purpleColor),
                  ),
                  Text(
                    _translation["author_unicef"]!,
                    style: TextStyle(color: purpleColor),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _translation["date"]!,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: purpleColor),
                  ),
                  Text(
                      formatter.format(
                          widget.preloadedStory!.createdOn ?? DateTime.now()),
                      style: TextStyle(
                        color: purpleColor,
                      ))
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: loadLocalHTML(
              widget.preloadedStory!.content!,
              widget.preloadedStory!.title ?? "",
              "widget.image",
              "widget.date"),
        ),
        Observer(builder: (context) {
          return Visibility(
            visible: _storyStore.canFinishReading,
            child: _storyStore.isActionLoading
                ? LoadingIndicatorComponent()
                : FinishReadingComponent(
                    translation: _translation,
                    storyId: widget.preloadedStory!.id.toString(),
                    initRating: _storyStore.rating,
                    onRateArticle: (int newRating) => _storyStore.rateStory(
                      storyId: widget.preloadedStory!.id.toString(),
                      rating: newRating,
                    ),
                  ),
          );
        })
      ],
    );
  }

  Widget fetchedArticle() {
    return Observer(
      builder: (context) {
        switch (_storyStore.isLoading) {
          case true:
            return Center(
              child: LoadingIndicatorComponent(),
            );

          case false:
            if (_storyStore.fetchedStory == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _translation["no_articles"]!,
                      style: TextStyle(color: purpleColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            }
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Color.fromRGBO(201, 13, 182, 1),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _storyStore.fetchedStory!.category!.name!
                                .split('/')[1]
                                .trim(),
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ClickSound.soundClick();
                              if (_storyStore.isBookmarked) {
                                _storyStore.removeBookmark(
                                    storyId: _storyStore.fetchedStory!.id!);
                              } else {
                                _storyStore.addBookmark(
                                    storyId: _storyStore.fetchedStory!.id!);
                              }
                            },
                            child: Observer(builder: (context) {
                              return Icon(
                                _storyStore.isBookmarked
                                    ? Icons.bookmark
                                    : Icons.bookmark_border_outlined,
                                color: purpleColor,
                                size: 30,
                              );
                            }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              ClickSound.soundShare();
                              Share.share(
                                  shareStoryUrl +
                                      "/" +
                                      _storyStore.fetchedStory!.id.toString(),
                                  subject: _storyStore.fetchedStory!.title
                                      .toString());
                            },
                            child: Icon(
                              Icons.share_outlined,
                              color: purpleColor,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Text(
                    _storyStore.fetchedStory!.title.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _translation["author"]!,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: purpleColor),
                          ),
                          Text(
                            _translation["author_unicef"]!,
                            style: TextStyle(color: purpleColor),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _translation["date"]!,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: purpleColor),
                          ),
                          Text(
                              formatter.format(
                                  _storyStore.fetchedStory!.createdOn ??
                                      DateTime.now()),
                              style: TextStyle(
                                color: purpleColor,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: loadLocalHTML(
                      _storyStore.fetchedStory!.content!,
                      _storyStore.fetchedStory!.title ?? "",
                      "widget.image",
                      "widget.date"),
                ),
                Observer(builder: (context) {
                  return Visibility(
                    visible: _storyStore.canFinishReading,
                    child: _storyStore.isActionLoading
                        ? LoadingIndicatorComponent()
                        : FinishReadingComponent(
                            translation: _translation,
                            storyId: _storyStore.fetchedStory!.id.toString(),
                            initRating: _storyStore.rating,
                            onRateArticle: (int newRating) =>
                                _storyStore.rateStory(
                              storyId: _storyStore.fetchedStory!.id.toString(),
                              rating: newRating,
                            ),
                          ),
                  );
                })
              ],
            );
        }
        return Container();
      },
    );
  }

  loadLocalHTML(String content, String title, String image, String date) {
    return Container(
      height: webViewHeight,
      child: WebViewPlus(
        onWebViewCreated: (controller) {
          webViewController = controller;
          controller.webViewController.clearCache();
          loadDataRaw(content, title, image, date);
        },
        onPageFinished: (url) {
          webViewController.webViewController
              .evaluateJavascript("document.body.scrollHeight")
              .then((value) {
            setState(() {
              webViewHeight = double.parse(value);
            });
          });
          content = content.replaceAll("\"", "\'");
          content = content.replaceAll("\\", "");
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  loadDataRaw(String content, String title, String image, String date) {
    String contentEx = content.split('').reversed.join();
    if (contentEx.length > 2097152) {
      contentEx = contentEx.replaceFirst(RegExp('>.*?gmi<'), '');
      if (contentEx.length > 2097152) {
        contentEx = contentEx.replaceFirst(RegExp('>.*?gmi<'), '');
        loadHtml(contentEx.split('').reversed.join(), title, image, date);
      } else {
        loadHtml(contentEx.split('').reversed.join(), title, image, date);
      }
    } else {
      loadHtml(contentEx.split('').reversed.join(), title, image, date);
    }
  }

  loadHtml(String content, String title, String image, String date) {
    final dateTime = DateTime.tryParse(date);
    final format = DateFormat('dd MMMM, yyyy');
    final clockString = dateTime == null ? "" : format.format(dateTime);

    content = content.replaceAll("src=\"//", "src=\"https:");

    String final_content = '''
    <!ECOTYPE html>
    <html> 
   <head>
   
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <style> 
    
    body{width: 90% !important;margin-left: auto;margin-right: auto;display: block;margin-top:10px;margin-bottom:10px;}
    img{width: 100% !important;margin-left: auto;margin-right: auto;display: block;margin-top:20px;margin-bottom:20px;}
    p{font-size: 24px;}
    span{font-size: 16px !important; line-height: 1.6 !important;}
     
    <style type="text/css" data-fbcssmodules="css:fb.css.base css:fb.css.dialog css:fb.css.iframewidget css:fb.css.customer_chat_plugin_iframe">.fb_hidden{position:absolute;top:-10000px;z-index:10001}.fb_reposition{overflow:hidden;position:relative}.fb_invisible{display:none}.fb_reset{background:none;border:0;border-spacing:0;color:#000;cursor:auto;direction:ltr;font-family:"lucida grande", tahoma, verdana, arial, sans-serif;font-size:11px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:1;margin:0;overflow:visible;padding:0;text-align:left;text-decoration:none;text-indent:0;text-shadow:none;text-transform:none;visibility:visible;white-space:normal;word-spacing:normal}.fb_reset>div{overflow:hidden}@keyframes fb_transform{from{opacity:0;transform:scale(.95)}to{opacity:1;transform:scale(1)}}.fb_animate{animation:fb_transform .3s forwards}
.fb_dialog{background:rgba(82, 82, 82, .7);position:absolute;top:-10000px;z-index:10001}.fb_dialog_advanced{border-radius:8px;padding:10px}.fb_dialog_content{background:#fff;color:#373737}.fb_dialog_close_icon{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 0 transparent;cursor:pointer;display:block;height:15px;position:absolute;right:18px;top:17px;width:15px}.fb_dialog_mobile .fb_dialog_close_icon{left:5px;right:auto;top:5px}.fb_dialog_padding{background-color:transparent;position:absolute;width:1px;z-index:-1}.fb_dialog_close_icon:hover{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -15px transparent}.fb_dialog_close_icon:active{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -30px transparent}.fb_dialog_iframe{line-height:0}.fb_dialog_content .dialog_title{background:#6d84b4;border:1px solid #365899;color:#fff;font-size:14px;font-weight:bold;margin:0}.fb_dialog_content .dialog_title>span{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yd/r/Cou7n-nqK52.gif) no-repeat 5px 50%;float:left;padding:5px 0 7px 26px}body.fb_hidden{height:100%;left:0;margin:0;overflow:visible;position:absolute;top:-10000px;transform:none;width:100%}.fb_dialog.fb_dialog_mobile.loading{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/ya/r/3rhSv5V8j3o.gif) white no-repeat 50% 50%;min-height:100%;min-width:100%;overflow:hidden;position:absolute;top:0;z-index:10001}.fb_dialog.fb_dialog_mobile.loading.centered{background:none;height:auto;min-height:initial;min-width:initial;width:auto}.fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner{width:100%}.fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content{background:none}.loading.centered #fb_dialog_loader_close{clear:both;color:#fff;display:block;font-size:18px;padding-top:20px}#fb-root #fb_dialog_ipad_overlay{background:rgba(0, 0, 0, .4);bottom:0;left:0;min-height:100%;position:absolute;right:0;top:0;width:100%;z-index:10000}#fb-root #fb_dialog_ipad_overlay.hidden{display:none}.fb_dialog.fb_dialog_mobile.loading iframe{visibility:hidden}.fb_dialog_mobile .fb_dialog_iframe{position:sticky;top:0}.fb_dialog_content .dialog_header{background:linear-gradient(from(#738aba), to(#2c4987));border-bottom:1px solid;border-color:#043b87;box-shadow:white 0 1px 1px -1px inset;color:#fff;font:bold 14px Helvetica, sans-serif;text-overflow:ellipsis;text-shadow:rgba(0, 30, 84, .296875) 0 -1px 0;vertical-align:middle;white-space:nowrap}.fb_dialog_content .dialog_header table{height:43px;width:100%}.fb_dialog_content .dialog_header td.header_left{font-size:12px;padding-left:5px;vertical-align:middle;width:60px}.fb_dialog_content .dialog_header td.header_right{font-size:12px;padding-right:5px;vertical-align:middle;width:60px}.fb_dialog_content .touchable_button{background:linear-gradient(from(#4267B2), to(#2a4887));background-clip:padding-box;border:1px solid #29487d;border-radius:3px;display:inline-block;line-height:18px;margin-top:3px;max-width:85px;padding:4px 12px;position:relative}.fb_dialog_content .dialog_header .touchable_button input{background:none;border:none;color:#fff;font:bold 12px Helvetica, sans-serif;margin:2px -12px;padding:2px 6px 3px 6px;text-shadow:rgba(0, 30, 84, .296875) 0 -1px 0}.fb_dialog_content .dialog_header .header_center{color:#fff;font-size:16px;font-weight:bold;line-height:18px;text-align:center;vertical-align:middle}.fb_dialog_content .dialog_content{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif) no-repeat 50% 50%;border:1px solid #4a4a4a;border-bottom:0;border-top:0;height:150px}.fb_dialog_content .dialog_footer{background:#f5f6f7;border:1px solid #4a4a4a;border-top-color:#ccc;height:40px}#fb_dialog_loader_close{float:left}.fb_dialog.fb_dialog_mobile .fb_dialog_close_icon{visibility:hidden}#fb_dialog_loader_spinner{animation:rotateSpinner 1.2s linear infinite;background-color:transparent;background-image:url(https://static.xx.fbcdn.net/rsrc.php/v3/yD/r/t-wz8gw1xG1.png);background-position:50% 50%;background-repeat:no-repeat;height:24px;width:24px}@keyframes rotateSpinner{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
.fb_iframe_widget{display:inline-block;position:relative}.fb_iframe_widget span{display:inline-block;position:relative;text-align:justify}.fb_iframe_widget iframe{position:absolute}.fb_iframe_widget_fluid_desktop,.fb_iframe_widget_fluid_desktop span,.fb_iframe_widget_fluid_desktop iframe{max-width:100%}.fb_iframe_widget_fluid_desktop iframe{min-width:220px;position:relative}.fb_iframe_widget_lift{z-index:1}.fb_iframe_widget_fluid{display:inline}.fb_iframe_widget_fluid span{width:100%}
.fb_mpn_mobile_landing_page_slide_out{animation-duration:200ms;animation-name:fb_mpn_landing_page_slide_out;transition-timing-function:ease-in}.fb_mpn_mobile_landing_page_slide_out_from_left{animation-duration:200ms;animation-name:fb_mpn_landing_page_slide_out_from_left;transition-timing-function:ease-in}.fb_mpn_mobile_landing_page_slide_up{animation-duration:500ms;animation-name:fb_mpn_landing_page_slide_up;transition-timing-function:ease-in}.fb_mpn_mobile_bounce_in{animation-duration:300ms;animation-name:fb_mpn_bounce_in;transition-timing-function:ease-in}.fb_mpn_mobile_bounce_out{animation-duration:300ms;animation-name:fb_mpn_bounce_out;transition-timing-function:ease-in}.fb_mpn_mobile_bounce_out_v2{animation-duration:300ms;animation-name:fb_mpn_fade_out;transition-timing-function:ease-in}.fb_customer_chat_bounce_in_v2{animation-duration:300ms;animation-name:fb_bounce_in_v2;transition-timing-function:ease-in}.fb_customer_chat_bounce_in_from_left{animation-duration:300ms;animation-name:fb_bounce_in_from_left;transition-timing-function:ease-in}.fb_customer_chat_bounce_out_v2{animation-duration:300ms;animation-name:fb_bounce_out_v2;transition-timing-function:ease-in}.fb_customer_chat_bounce_out_from_left{animation-duration:300ms;animation-name:fb_bounce_out_from_left;transition-timing-function:ease-in}.fb_invisible_flow{display:inherit;height:0;overflow-x:hidden;width:0}@keyframes fb_mpn_landing_page_slide_out{0%{margin:0 12px;width:100% - 24px}60%{border-radius:18px}100%{border-radius:50%;margin:0 24px;width:60px}}@keyframes fb_mpn_landing_page_slide_out_from_left{0%{left:12px;width:100% - 24px}60%{border-radius:18px}100%{border-radius:50%;left:12px;width:60px}}@keyframes fb_mpn_landing_page_slide_up{0%{bottom:0;opacity:0}100%{bottom:24px;opacity:1}}@keyframes fb_mpn_bounce_in{0%{opacity:.5;top:100%}100%{opacity:1;top:0}}@keyframes fb_mpn_fade_out{0%{bottom:30px;opacity:1}100%{bottom:0;opacity:0}}@keyframes fb_mpn_bounce_out{0%{opacity:1;top:0}100%{opacity:.5;top:100%}}@keyframes fb_bounce_in_v2{0%{opacity:0;transform:scale(0, 0);transform-origin:bottom right}50%{transform:scale(1.03, 1.03);transform-origin:bottom right}100%{opacity:1;transform:scale(1, 1);transform-origin:bottom right}}@keyframes fb_bounce_in_from_left{0%{opacity:0;transform:scale(0, 0);transform-origin:bottom left}50%{transform:scale(1.03, 1.03);transform-origin:bottom left}100%{opacity:1;transform:scale(1, 1);transform-origin:bottom left}}@keyframes fb_bounce_out_v2{0%{opacity:1;transform:scale(1, 1);transform-origin:bottom right}100%{opacity:0;transform:scale(0, 0);transform-origin:bottom right}}@keyframes fb_bounce_out_from_left{0%{opacity:1;transform:scale(1, 1);transform-origin:bottom left}100%{opacity:0;transform:scale(0, 0);transform-origin:bottom left}}@keyframes slideInFromBottom{0%{opacity:.1;transform:translateY(100%)}100%{opacity:1;transform:translateY(0)}}@keyframes slideInFromBottomDelay{0%{opacity:0;transform:translateY(100%)}97%{opacity:0;transform:translateY(100%)}100%{opacity:1;transform:translateY(0)}}</style>
     
    </style> 
    
    </head>
    <body> 
    <div class="image_box"><img class = "title_image" src="$image"></div>
      <div class="header_time">$clockString</div>
    <div style=" font-weight: bold; margin-top:10px; margin-bottom: 10px; font-size: 20px "><h2>$title</h2></div>
    <div  >$content</div> 
    </body> 
    </html>''';

    String final_content_offline = '''
    
    <!ECOTYPE html>
    <html> 
    <style> 
    img{width: 100% !important;margin-left: auto;margin-right: auto;display: block;margin-top:20px;margin-bottom:20px;} 
    iframe{width: 100% !important;margin-left: auto;margin-right: auto;display: block;margin-top:20px;margin-bottom:20px;} 
    body{width: 90% !important;margin-left: auto;margin-right: auto;display: block;margin-top:10px;margin-bottom:10px;} 
    p{font-size: 24px;}
    span{font-size: 16px !important; line-height: 1.6 !important;}
    .header_group{
      display: inline-flex;
    }
    .header_group img {
      height: 20px;
      margin: 0 0 0 5px !important;
    }
    .header_time{
       margin-top: 3px;
       font-size: 14px;
       font-weight: bold;
    }
    .header_share{
      margin-right: 20px;
    }
    </style> 
    <head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
    <body> 
    <div style="font-weight: bold; margin-top:10px; margin-bottom: 10px; font-size: 20px "><h2>$title</h2></div>
    <div  >$content</div> 
    </body> 
    </html>''';

    webViewController.loadUrl(Uri.dataFromString(final_content,
            mimeType: 'text/html', encoding: Encoding.getByName("UTF-8"))
        .toString());
  }
}
