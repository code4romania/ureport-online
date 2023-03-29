import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/controllers/category_stories_store.dart';
import 'package:ureport_ecaro/ui/pages/home/components/quiz_component.dart';
import 'package:ureport_ecaro/ui/pages/home/components/recent_opinions_component.dart';
import 'package:ureport_ecaro/ui/pages/home/components/recent_stories_component.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/translation.dart';
import '../../../utils/constants.dart';
import 'package:ureport_ecaro/models/response_opinions.dart' as opinionsarray;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StateStore _stateStore;
  late CategoryStories _storyStore;
  late Map<String, String> _translation;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _storyStore = CategoryStories();

    _translation =
        translations["${_stateStore.selectedLanguage}"]!["home_screen"]!;

    super.initState();

    _storyStore.getRecentStories();
    _storyStore.getRecentOpinions();
  }

  @override
  Widget build(BuildContext context) {
    final futureStories = _storyStore.recentStories;
    final futureOpinions = _storyStore.recentOpinions;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopHeaderWidget(title: _translation["header"]!),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                _translation["title"]! + "Nume" + " !",
                style: titleBlackTextStlye,
              ),
            ),
            QuizComponent(),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Observer(
                builder: (context) {
                  if (futureStories == null) {
                    return Text(
                      _translation["no_articles"]!,
                      style: TextStyle(color: Colors.black),
                    );
                  }
                  switch (futureStories.status) {
                    case FutureStatus.pending:
                      return Center(
                        child: LoadingIndicatorComponent(),
                      );
                    case FutureStatus.rejected:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              _translation["empty_stories"]!,
                              style: TextStyle(color: purpleColor),
                            ),
                          ],
                        ),
                      );
                    case FutureStatus.fulfilled:
                      return RecentStoriesComponent(
                        translation: _translation,
                        recentStories: futureStories.result,
                      );
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Observer(
                builder: (context) {
                  if (futureOpinions == null) {
                    return Text(
                      _translation["no_opinions"]!,
                      style: TextStyle(color: Colors.black),
                    );
                  }
                  switch (futureOpinions.status) {
                    case FutureStatus.pending:
                      return Center(
                        child: LoadingIndicatorComponent(),
                      );
                    case FutureStatus.rejected:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              _translation["no_opinions"]!,
                              style: TextStyle(color: purpleColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    case FutureStatus.fulfilled:
                      List<opinionsarray.Question> result =
                          futureOpinions.result;

                      return RecentOpinionsComponent(
                        translation: _translation,
                        recentOpinions: result,
                      );
                  }
                },
              ),
            ),
            // RecentOpinions(),
          ],
        ),
      ),
    );
  }
}
