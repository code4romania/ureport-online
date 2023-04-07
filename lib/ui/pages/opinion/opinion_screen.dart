import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';
import '../../../controllers/app_router.gr.dart';
import '../../../controllers/state_store.dart';
import '../../../models/response-opinion-localdb.dart';
import 'components/opinion_item.dart';
import 'components/statistics_header.dart';
import '../../shared/top_header_widget.dart';
import '../../../utils/sp_utils.dart';
import '../../../utils/translation.dart';
import '../../../locator/locator.dart';
import '../../../services/click_sound_service.dart';
import '../../../utils/constants.dart';
import '../../../controllers/opinion_controller.dart';
import '../../../models/response_opinions.dart' as questionArray;

class Opinion extends StatefulWidget {
  const Opinion({Key? key}) : super(key: key);

  @override
  _OpinionState createState() => _OpinionState();
}

var count = 0;

class _OpinionState extends State<Opinion> {
  var sp = locator<SPUtil>();
  List<Color> colors = [
    blueColor,
    blueColor,
  ];
  int colorNumber = 0;

  late StateStore _stateStore;
  late Map<String, String> _translation;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();

    _translation =
        translations["${_stateStore.selectedLanguage}"]!["opinion_screen"]!;
    super.initState();
    Provider.of<OpinionController>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    List<ResultOpinionLocal>? opinions = [];

    if (Provider.of<OpinionController>(context, listen: false).isLoaded) {
      Provider.of<OpinionController>(context, listen: false).checkOpinion(
          "https://ureport.in/api/v1/polls/org/13/featured/",
          "U-REPORT STAGING");
      Provider.of<OpinionController>(context, listen: false).isLoaded = false;
    }

    return Consumer<OpinionController>(builder: (context, provider, child) {
      var _futureOpinion = provider.getOpinionsFromLocal("U-REPORT STAGING", 0);
      return Scaffold(
          body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopHeaderWidget(title: _translation["header"]!),
              Container(
                child: Divider(
                  height: 1,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              provider.isSyncing
                  ? Container(
                      height: 5,
                      padding: EdgeInsets.only(left: 13, right: 13),
                      child: LinearProgressIndicator(
                        color: blueColor,
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: () {
                    ClickSound.soundClick();
                    context.router.push(OpinionSearchScreenRoute());
                  },
                  child: Card(
                    elevation: 2,
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _translation["search"]!,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey,
                              size: 38,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder<List<ResultOpinionLocal>>(
                    future: _futureOpinion,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        opinions = snapshot.data;
                        if (opinions!.length > 0) {
                          var mapdata = jsonDecode(opinions![0].questions);
                          // questionList.clear();
                          List<questionArray.Question> questionList = (mapdata
                                  as List)
                              .map((e) => questionArray.Question.fromJson(e))
                              .toList();
                          return snapshot.hasData
                              ? RefreshIndicator(
                                  onRefresh: () {
                                    return _futureOpinion =
                                        getDataFromApi(context, provider);
                                  },
                                  child: SingleChildScrollView(
                                    physics: AlwaysScrollableScrollPhysics(),
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      margin: EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          questionList.length > 0
                                              ? StatisticsHeader
                                                  .getHeadingStatistics(
                                                  questionList.first,
                                                  opinions![0],
                                                  provider,
                                                  "U-REPORT STAGING",
                                                  context,
                                                  _translation,
                                                )
                                              : StatisticsHeader
                                                  .getHeadingStatisticsEmpty(
                                                      opinions![0],
                                                      context,
                                                      _translation),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              itemCount: questionList.length,
                                              itemBuilder:
                                                  (context, int index) {
                                                if (colorNumber >
                                                    colors.length - 1) {
                                                  colorNumber = 0;
                                                }
                                                return OpinionItem(
                                                    questionList[index],
                                                    colors[questionList[index]
                                                                .resultsByGender
                                                                .length !=
                                                            0
                                                        ? colorNumber++
                                                        : colorNumber]);
                                              })
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 60,
                                  width: 60,
                                  child: LoadingIndicatorComponent());
                        } else {
                          return Container(
                            height: 60,
                            width: 60,
                            child: LoadingIndicatorComponent(),
                          );
                        }
                      } else {
                        return Container(
                          height: 60,
                          width: 60,
                          child: LoadingIndicatorComponent(),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ));
    });
  }

  Future<dynamic> getDataFromApi(
      BuildContext context, OpinionController provider) async {
    if (provider.isOnline) {
      Provider.of<OpinionController>(context, listen: false).setSyncing();
      Provider.of<OpinionController>(context, listen: false).isLoading = false;
      return Provider.of<OpinionController>(context, listen: false)
          .checkOpinion("https://ureport.in/api/v1/polls/org/13/featured/",
              "U-REPORT STAGING");
    } else {
      return SnackBar(content: Text(_translation["no_internet"]!));
    }
  }
}
