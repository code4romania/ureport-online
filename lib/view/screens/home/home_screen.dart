import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/data/translation.dart';
import 'package:ureport_ecaro/view_model/state_store.dart';
import 'package:ureport_ecaro/view_model/story_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StateStore _stateStore;
  late Map<String, String> _translation;
  late StoryStore _storyStore;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _storyStore = StoryStore();
    _translation =
        translations["${_stateStore.selectedLanguage}"]!["home_screen"]!;

    super.initState();

    _storyStore.fetchCategories();

//    _storyStore.fetchStories();
    //   final future = _storyStore.storiesList;
  }

  // Future _refresh() {
  //   return _storyStore.fetchStories();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [],
      ))),
    );
  }
}
