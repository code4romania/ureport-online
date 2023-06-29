import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/models/badge_medal.dart';
import 'package:ureport_ecaro/ui/shared/cached_image_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import 'package:ureport_ecaro/ui/shared/text_navigator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/constants.dart';
import 'package:ureport_ecaro/utils/translation.dart';

class BadgesScreen extends StatefulWidget {
  const BadgesScreen({super.key});

  @override
  State<BadgesScreen> createState() => _BadgesScreenState();
}

class _BadgesScreenState extends State<BadgesScreen> {
  late StateStore _stateStore;
  late CategoryStories _categoryStories;
  late Map<String, String> _translation;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _categoryStories = CategoryStories();

    _translation =
        translations["${_stateStore.selectedLanguage}"]!["category_screen"]!;
    super.initState();
    _categoryStories.getBadges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: TopHeaderWidget(title: _translation["header"]!),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 20),
              color: Color.fromRGBO(28, 171, 226, 1),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TextNavigatorComponent(
                      rightEdge: false,
                      darkMode: true,
                      title: _translation["back"]!,
                      onPressed: () => context.router.pop(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _translation["badges_title"]!,
                      style: titleWhiteTextStlye,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Observer(
            builder: (context) {
              if (_categoryStories.badgesLoading) {
                return SliverToBoxAdapter(
                    child: Center(child: LoadingIndicatorComponent()));
              }
              if (_categoryStories.badges.isEmpty) {
                return SliverToBoxAdapter(
                    child: Center(child: Text(_translation["no_badges"]!)));
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _MedalWidget(
                    onPressedShare: () async {
                      var response = await http.get(
                          Uri.parse(_categoryStories.badges[index].image!));
                      final directory = await getTemporaryDirectory();
                      final imagePath = '${directory.path}/image.jpg';

                      // Save the image to a temporary file
                      File imageFile = File(imagePath);
                      await imageFile.writeAsBytes(response.bodyBytes);

                      final text =
                          '${_translation["shareMedalTitle"]!}\n${_translation["shareMedalBody"]!}';
                      Share.shareXFiles([XFile(imagePath)], text: text);
                    },
                    medal: _categoryStories.badges[index],
                    isLastItem: index == _categoryStories.badges.length - 1,
                    shareText: _translation["share"]!,
                  ),
                  childCount: _categoryStories.badges.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _MedalWidget extends StatelessWidget {
  const _MedalWidget({
    Key? key,
    required this.medal,
    required this.isLastItem,
    required this.onPressedShare,
    required this.shareText,
  }) : super(key: key);

  final BadgeMedal medal;
  final bool isLastItem;
  final VoidCallback onPressedShare;
  final String shareText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            child: CachedImageComponent(
              imageUrl: medal.image ?? "",
              blockedImage: medal.owned == true ? null : true,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              medal.title ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                fontFamily: 'Inter',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              medal.description ?? "",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
              ),
            ),
          ),
          TextButton.icon(
            onPressed: onPressedShare,
            icon: Icon(Icons.share),
            label: Text(
              shareText,
            ),
          ),
        ],
      ),
    );
  }
}
