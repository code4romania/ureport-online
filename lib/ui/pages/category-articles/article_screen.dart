import 'dart:convert';
import 'dart:io';
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
import 'package:ureport_ecaro/services/click_sound_service.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/article_header_component.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/finish_reading_component.dart';
import 'package:ureport_ecaro/ui/pages/category-articles/components/rating_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import 'package:ureport_ecaro/ui/shared/text_navigator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/article_html.dart';
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

class _ArticleScreenState extends State<ArticleScreen>
    with TickerProviderStateMixin {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  late WebViewPlusController webViewController;
  late StateStore _stateStore;
  late StoryStore _storyStore;
  late Map<String, String> _translation;

  double topBarHeight = 0;
  double webViewHeight = 0;

  @override
  void initState() {
    final spUtil = SPUtil();

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
    super.initState();

    reaction(
      (p0) => _storyStore.scrolledToTheBottom && _storyStore.finishedTimer,
      (p0) => _showClaimedBadge(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      topBarHeight = 80;
      webViewHeight = MediaQuery.of(context).size.height - 130;
    } else {
      topBarHeight = 110;
      webViewHeight = MediaQuery.of(context).size.height - 160;
    }
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Observer(builder: (context) {
              return _storyStore.canShowRating
                  ? GestureDetector(
                      onTap: _rateArticle,
                      child: Container(
                          width: 50,
                          height: 50,
                          child: Image.asset("assets/images/star_icon.png")),
                    )
                  : SizedBox();
            }),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: _scrollToTop,
              child: Container(
                width: 50,
                height: 50,
                child: Image.asset(
                  "assets/images/arrow_up_rectangular.png",
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: topBarHeight,
            child: TopHeaderWidget(
              title: _translation["header"]!,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: TextNavigatorComponent(
                  title: _translation["back"]!,
                  rightEdge: false,
                  onPressed: () => context.router.pop(),
                ),
              ),
              Observer(builder: (context) {
                if (widget.preloadedStory != null) {
                  return ArticleHeaderComponent(
                    storyId: _storyStore.storyId,
                    isBookmarked: _storyStore.isBookmarked,
                    onShare: () {
                      ClickSound.soundShare();
                      Share.share(
                          shareStoryUrl +
                              "/" +
                              widget.preloadedStory!.id.toString(),
                          subject: widget.preloadedStory!.title.toString());
                    },
                    onBookmark: () {
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
                    },
                  );
                } else {
                  return ArticleHeaderComponent(
                    storyId: _storyStore.storyId,
                    isBookmarked: _storyStore.isBookmarked,
                    onShare: () {
                      ClickSound.soundShare();
                      Share.share(
                          shareStoryUrl +
                              "/" +
                              _storyStore.fetchedStory!.id.toString(),
                          subject: _storyStore.fetchedStory!.title.toString());
                    },
                    onBookmark: () {
                      ClickSound.soundClick();
                      if (_storyStore.isBookmarked) {
                        _storyStore.removeBookmark(
                            storyId: _storyStore.fetchedStory!.id!);
                      } else {
                        _storyStore.addBookmark(
                            storyId: _storyStore.fetchedStory!.id!);
                      }
                    },
                  );
                }
              }),
            ],
          ),
          !widget.isComingFromHome ? fetchedArticle() : preloadedArticle(),
        ],
      ),
    );
  }

  Widget preloadedArticle() {
    return Observer(
      builder: (context) {
        return Container(
          width: double.infinity,
          child: loadLocalHTML(
            content: widget.preloadedStory!.content!,
            title: widget.preloadedStory?.title ?? "",
            author: widget.preloadedStory?.written_by ??
                _translation["author_unicef"]!,
            date: widget.preloadedStory!.created_on,
            category: widget.preloadedStory!.category!.name!.split('/')[1],
          ),
        );
      },
    );
  }

  Widget fetchedArticle() {
    return Observer(
      builder: (context) {
        switch (_storyStore.isLoading) {
          case true:
            return Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: LoadingIndicatorComponent(),
              ),
            );

          case false:
            if (_storyStore.fetchedStory == null) {
              return Center(
                child: Column(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(builder: (context) {
                  return loadLocalHTML(
                    content: _storyStore.fetchedStory!.content!,
                    title: _storyStore.fetchedStory!.title ?? "",
                    date: _storyStore.fetchedStory!.created_on,
                    author: _storyStore.fetchedStory!.written_by ??
                        _translation["author_unicef"]!,
                    category: _storyStore.fetchedStory!.category!.name!
                        .split('/')[1]
                        .trim(),
                  );
                }),
              ],
            );
        }
        return Container();
      },
    );
  }

  Widget loadLocalHTML({
    required String content,
    required String title,
    required DateTime? date,
    required String author,
    required String category,
  }) {
    return Container(
      height: webViewHeight,
      width: double.infinity,
      child: WebViewPlus(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) async {
          webViewController = controller;
          controller.webViewController.clearCache();

          loadDataRaw(
            content: content,
            title: title,
            dateText: _translation["date"]!,
            date: date,
            authorText: _translation["author"]!,
            author: author,
            category: category,
          );
        },
        gestureNavigationEnabled: true,
        javascriptChannels: [
          JavascriptChannel(
              name: 'FLUTTER_CHANNEL',
              onMessageReceived: (message) {
                if (_storyStore.scrolledToTheBottom) {
                  return;
                } else {
                  if (message.message.toString() == "end of scroll") {
                    _storyStore.scrolledToTheBottom = true;
                  }

                  if (message.message.toString() == "not scrollable") {
                    _storyStore.scrolledToTheBottom = true;
                  }
                }
              }),
        ].toSet(),
        onPageFinished: (url) async {
          content = content.replaceAll("\"", "\'");
          content = content.replaceAll("\\", "");
        },
      ),
    );
  }

  loadDataRaw({
    required String content,
    required String title,
    required String dateText,
    required DateTime? date,
    required String authorText,
    required String author,
    required String category,
  }) {
    String contentEx = content.split('').reversed.join();
    if (contentEx.length > 2097152) {
      contentEx = contentEx.replaceFirst(RegExp('>.*?gmi<'), '');
      if (contentEx.length > 2097152) {
        contentEx = contentEx.replaceFirst(RegExp('>.*?gmi<'), '');
        loadHtml(
          content: contentEx.split('').reversed.join(),
          title: title,
          dateText: dateText,
          date: date,
          authorText: authorText,
          author: author,
          category: category,
        );
      } else {
        loadHtml(
          content: contentEx.split('').reversed.join(),
          title: title,
          dateText: dateText,
          date: date,
          authorText: authorText,
          author: author,
          category: category,
        );
      }
    } else {
      loadHtml(
        content: contentEx.split('').reversed.join(),
        title: title,
        dateText: dateText,
        date: date,
        authorText: authorText,
        author: author,
        category: category,
      );
    }
  }

  loadHtml({
    required String content,
    required String title,
    required String dateText,
    required DateTime? date,
    required String authorText,
    required String author,
    required String category,
  }) {
    final format = DateFormat('dd.MM.yyyy');
    final String formattedDate = date != null ? format.format(date) : "";

    content = content.replaceAll("src=\"//", "src=\"https:");

    final finalContent = getHtmlContent(
      content: content,
      title: title,
      dateText: dateText,
      formattedDate: formattedDate,
      category: category,
      author: author,
      authorText: authorText,
    );

    webViewController.loadUrl(Uri.dataFromString(finalContent,
            mimeType: 'text/html', encoding: Encoding.getByName("UTF-8"))
        .toString());
  }

  void _scrollToTop() {
    webViewController.webViewController
        .runJavascript("window.scrollTo({top: 0, behavior: 'smooth'});");
  }

  void _showClaimedBadge() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              height: 250,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color.fromRGBO(167, 45, 111, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: FinishReadingComponent(
                translation: _translation,
                translationProfile: translations[
                    "${_stateStore.selectedLanguage}"]!["profile_screen"]!,
                storyId: _storyStore.storyId.toString(),
                profile: _stateStore.profile!,
              ),
            ),
          );
        });
  }

  void _rateArticle() {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              height: 300,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Observer(builder: (context) {
                return RatingComponent(
                  ratingTitle: _translation["ratingTitle"]!,
                  ratingBody: _translation["ratingBody"]!,
                  submitText: _translation["submitRating"]!,
                  initialRating: _storyStore.rating,
                  onRate: (rating) {
                    _storyStore.rateStory(
                        storyId: _storyStore.storyId, rating: rating);
                  },
                );
              }),
            ),
          );
        });
  }

  @override
  void dispose() {
    _storyStore.cancelTimer();
    super.dispose();
  }
}
