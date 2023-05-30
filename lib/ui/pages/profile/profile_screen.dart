import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:share/share.dart';
import 'package:ureport_ecaro/controllers/app_router.gr.dart';
import 'package:ureport_ecaro/controllers/profile_info_store.dart';
import 'package:ureport_ecaro/models/profile.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';

import '../../shared/text_navigator_component.dart';
import '../../shared/top_header_widget.dart';
import 'components/history_widget.dart';
import 'components/medal_widget.dart';
import 'components/profile_header_component.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
      {Key? key,
      required this.translation,
      this.profile,
      required this.initialIndex})
      : super(key: key);
  final Map<String, String> translation;
  final Profile? profile;
  final initialIndex;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _controller;

  late ProfileInfoStore _profileInfoStore;
  late SPUtil spUtil;

  @override
  void initState() {
    spUtil = SPUtil();
    _profileInfoStore = ProfileInfoStore(spUtil);

    _controller = TabController(
      initialIndex: widget.initialIndex,
      length: 2,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(children: [
          TopHeaderWidget(
            title: widget.translation["header"]!,
          ),
          TextNavigatorComponent(
            title: widget.translation["back"]!,
            onPressed: () => context.router.pop(),
            rightEdge: false,
          ),
          ProfileHeaderComponent(
            profile: widget.profile!,
          ),
          Container(
            width: 400,
            height: 100,
            child: Theme(
              data: ThemeData(
                  splashColor: Color.fromRGBO(68, 151, 223, 0.2),
                  highlightColor: Color.fromRGBO(68, 151, 223, 0.2)),
              child: TabBar(
                indicatorColor: Color.fromRGBO(68, 151, 223, 1),
                unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.5),
                labelColor: Color.fromRGBO(68, 151, 223, 1),
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                controller: _controller,
                tabs: [
                  Text(
                    widget.translation["library"]!,
                  ),
                  Text(
                    widget.translation["medals"]!,
                    style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: TabBarView(
              controller: _controller,
              children: [
                Observer(builder: (context) {
                  if (_profileInfoStore.bookmarksLoading) {
                    return Center(child: LoadingIndicatorComponent());
                  }
                  if (_profileInfoStore.bookmarks.isEmpty) {
                    return Center(
                        child: Text(widget.translation["no_bookmarks"]!));
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: _profileInfoStore.bookmarks.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => context.router
                              .push(
                                ArticleScreenRoute(
                                  isComingFromHome: false,
                                  storyId: _profileInfoStore
                                      .bookmarks[index].story!.id,
                                ),
                              )
                              .then((value) =>
                                  _profileInfoStore.fetchBookmarks()),
                          child: BookmarkWidget(
                            bookmarkItem: _profileInfoStore.bookmarks[index],
                            onPressedShare: () {
                              Share.share(
                                  subject:
                                      widget.translation["shareBookmarkTitle"]!,
                                  widget.translation["shareBookmarkBody"]!);
                            },
                            isLastItem:
                                index == _profileInfoStore.bookmarks.length - 1,
                          ),
                        ),
                      ),
                    );
                  }
                }),
                Observer(builder: (context) {
                  if (_profileInfoStore.badgesLoading) {
                    return Center(child: LoadingIndicatorComponent());
                  }
                  if (_profileInfoStore.badges.isEmpty) {
                    return Center(
                        child: Text(widget.translation["no_badges"]!));
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: _profileInfoStore.badges.length,
                      itemBuilder: (context, index) => MedalWidget(
                        onPressedShare: () {
                          Share.share(
                              subject: widget.translation["shareMedalTitle"]!,
                              widget.translation["shareMedalBody"]!);
                        },
                        medal: _profileInfoStore.badges[index],
                        isLastItem:
                            index == _profileInfoStore.badges.length - 1,
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
