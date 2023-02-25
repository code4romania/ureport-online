import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/controllers/state_store.dart';
import 'package:ureport_ecaro/controllers/story_state.dart';
import 'package:ureport_ecaro/ui/shared/top_header_widget.dart';
import 'package:ureport_ecaro/utils/translation.dart';
import '../../../utils/constants.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          TopHeaderWidget(title: _translation["header"]!),
          Text(
            _translation["title"]!,
            style: titleTextStlye,
          ),
        ],
      ))),
    );
  }
}
