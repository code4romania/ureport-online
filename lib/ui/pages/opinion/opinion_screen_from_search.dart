import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:ureport_ecaro/models/response-opinion-localdb.dart';
import 'package:ureport_ecaro/ui/pages/opinion/components/statistics_header.dart';
import 'package:ureport_ecaro/ui/shared/loading_indicator_component.dart';

import '../../../../models/response_opinions.dart' as questionArray;
import '../../../controllers/opinion_controller.dart';
import '../../../controllers/state_store.dart';
import '../../../locator/locator.dart';
import '../../../services/click_sound_service.dart';
import '../../../utils/constants.dart';
import '../../../utils/sp_utils.dart';
import '../../../utils/translation.dart';
import 'components/opinion_item.dart';

class OpinionScreenFromSearch extends StatefulWidget {
  const OpinionScreenFromSearch({Key? key}) : super(key: key);

  @override
  _OpinionScreenFromSearchState createState() =>
      _OpinionScreenFromSearchState();
}

var count = 0;

class _OpinionScreenFromSearchState extends State<OpinionScreenFromSearch> {
  var sp = locator<SPUtil>();
  List<Color> colors = [
    purpleColor,
    purpleColor,
    purpleColor,
  ];
  int colorNumber = 0;

  late StateStore _stateStore;
  late Map<String, String> _translation;

  @override
  void initState() {
    _stateStore = context.read<StateStore>();
    _translation = translations["${_stateStore.selectedLanguage}"]![
        "opinion_screen_from_search"]!;
    super.initState();
    Provider.of<OpinionController>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    List<ResultOpinionLocal>? opinions = [];

    if (Provider.of<OpinionController>(context, listen: false).isLoaded) {
      Provider.of<OpinionController>(context, listen: false).checkOpinion(
          "https://ureport.in/api/v1/polls/org/13/featured/",
          sp.getValue(SPUtil.PROGRAMKEY));
      Provider.of<OpinionController>(context, listen: false).isLoaded = false;
    }

    return Consumer<OpinionController>(builder: (context, provider, child) {
      var _futureOpinion = provider.getOpinionsFromLocal(
          sp.getValue(SPUtil.PROGRAMKEY), provider.opinionID);
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        child: IconButton(
                                          icon: Container(
                                              child: Image(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                "assets/images/v2_ic_back.png"),
                                          )),
                                          color: Colors.black,
                                          onPressed: () {
                                            Navigator.pop(context);
                                            ClickSound.soundClose();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        child: Center(
                                          child: getShareButton(
                                              "${provider.opinionID}"),
                                        ),
                                      ))
                                    ],
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: CustomPaint(
                                  painter: CustomBackground(),
                                  child: Container(
                                    height: 80,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Center(
                                        child: Text(
                                          _translation["opinions"]!,
                                          style: TextStyle(
                                              fontSize: 26.0,
                                              color: Color.fromRGBO(
                                                  167, 45, 111, 1),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Divider(
                          height: 1,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Divider(
                      height: 1,
                      color: Colors.grey[600],
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
                              List<questionArray.Question> questionList =
                                  (mapdata as List)
                                      .map((e) =>
                                          questionArray.Question.fromJson(e))
                                      .toList();
                              return snapshot.hasData
                                  ? RefreshIndicator(
                                      onRefresh: () {
                                        return _futureOpinion =
                                            getDataFromApi(context, provider);
                                      },
                                      child: SingleChildScrollView(
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 15, right: 15),
                                          margin: EdgeInsets.only(top: 10),
                                          child: Column(
                                            children: [
                                              questionList.length > 0
                                                  ? StatisticsHeader
                                                      .getHeadingStatistics(
                                                      questionList[0],
                                                      opinions![0],
                                                      provider,
                                                      sp.getValue(
                                                          SPUtil.PROGRAMKEY),
                                                      context,
                                                      _translation,
                                                    )
                                                  : StatisticsHeader
                                                      .getHeadingStatisticsEmpty(
                                                      opinions![0],
                                                      context,
                                                      _translation,
                                                    ),
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  itemCount:
                                                      questionList.length,
                                                  itemBuilder:
                                                      (context, int index) {
                                                    if (colorNumber >
                                                        colors.length - 1) {
                                                      colorNumber = 0;
                                                    }
                                                    return OpinionItem(
                                                        questionList[index],
                                                        colors[questionList[
                                                                        index]
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
                                      child: LoadingIndicatorComponent(),
                                    );
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
              sp.getValue(SPUtil.PROGRAMKEY));
    } else {
      return SnackBar(content: Text(_translation["no_internet"]!));
    }
  }

  getShareButton(String id) {
    return GestureDetector(
      onTap: () async {
        ClickSound.soundClick();
        await Share.share("https://ureport.in/opinion/" + id);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SHARE",
              style: TextStyle(fontSize: 15, color: purpleColor),
            ),
            SizedBox(
              width: 5,
            ),
            Image(
              image: AssetImage("assets/images/ic_share.png"),
              height: 17,
              width: 17,
              color: purpleColor,
            )
          ],
        ),
      ),
    );
  }
}

class CustomBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.white],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(size.width / 5, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 5, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
