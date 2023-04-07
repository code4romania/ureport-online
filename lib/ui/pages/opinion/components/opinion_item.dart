import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/state_store.dart';
import '../../../../models/response_opinions.dart' as questionArray;
import '../../../../services/click_sound_service.dart';
import '../../../../utils/translation.dart';
import '../../../number_format.dart';
import 'statistics_age.dart';
import 'statistics_all.dart';
import 'statistics_gender.dart';
import 'statistics_location_spinner.dart';
import 'word_cloud.dart';

class OpinionItem extends StatefulWidget {
  questionArray.Question question;
  Color color;

  OpinionItem(this.question, this.color);

  @override
  _OpinionItemState createState() => _OpinionItemState(question, color);
}

class _OpinionItemState extends State<OpinionItem> {
  questionArray.Question question;
  Color color;

  int selectedTab = 0;

  _OpinionItemState(this.question, this.color);

  late StateStore _stateStore;
  late Map<String, String> _translation;

  @override
  Widget build(BuildContext context) {
    _stateStore = context.read<StateStore>();
    _translation =
        translations["${_stateStore.selectedLanguage}"]!["opinion_item"]!;
    int set = question.results.resultsSet;
    int unset = question.results.unset;
    int total = set + unset;

    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Question
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                question.title,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Text(
                "${FormattedNumber.formatNumber(set)} ${_translation["responded_out_of"]!}  ${FormattedNumber.formatNumber(total)} ${_translation["polled"]!}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[500],
                    fontSize: 14),
              ),
            ),
            SizedBox(height: 9),
            //Tab
            question.resultsByGender.length != 0
                ? Column(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //All
                                Expanded(
                                  flex: 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      ClickSound.soundTap();
                                      setState(() {
                                        selectedTab = 0;
                                      });
                                    },
                                    child: Container(
                                      height: 26,
                                      decoration: BoxDecoration(
                                        color: selectedTab == 0
                                            ? Colors.grey[700]
                                            : Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            bottomLeft: Radius.circular(30)),
                                      ),
                                      child: Center(
                                          child: Container(
                                        child: Text(
                                          _translation["all"]!,
                                          style: TextStyle(
                                              color: selectedTab == 0
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 11),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 26,
                                  child: VerticalDivider(
                                    width: 1,
                                    thickness: 1,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                //Age
                                Expanded(
                                  flex: 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      ClickSound.soundTap();
                                      setState(() {
                                        selectedTab = 1;
                                      });
                                    },
                                    child: Container(
                                      height: 26,
                                      color: selectedTab == 1
                                          ? Colors.grey[700]
                                          : Colors.white,
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      child: Center(
                                          child: Text(
                                        _translation["age"]!,
                                        style: TextStyle(
                                            color: selectedTab == 1
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 11),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 26,
                                  child: VerticalDivider(
                                    width: 1,
                                    thickness: 1,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                //Gender
                                Expanded(
                                  flex: 5,
                                  child: GestureDetector(
                                    onTap: () {
                                      ClickSound.soundTap();
                                      setState(() {
                                        selectedTab = 2;
                                      });
                                    },
                                    child: Container(
                                      height: 26,
                                      color: selectedTab == 2
                                          ? Colors.grey[700]
                                          : Colors.white,
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      child: Center(
                                          child: Text(
                                        _translation["gender"]!,
                                        style: TextStyle(
                                            color: selectedTab == 2
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 11),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 26,
                                  child: VerticalDivider(
                                    width: 1,
                                    thickness: 1,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                //Location
                                Expanded(
                                  flex: 8,
                                  child: GestureDetector(
                                    onTap: () {
                                      ClickSound.soundTap();
                                      setState(() {
                                        selectedTab = 3;
                                      });
                                    },
                                    child: Container(
                                      height: 26,
                                      decoration: BoxDecoration(
                                        color: selectedTab == 3
                                            ? Colors.grey[700]
                                            : Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(30)),
                                      ),
                                      padding: EdgeInsets.only(
                                          top: 5, bottom: 5, right: 7),
                                      child: Center(
                                          child: Text(
                                        _translation["location"]!,
                                        style: TextStyle(
                                            color: selectedTab == 3
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 11),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //Divider
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Divider(
                          height: 1.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      //body
                      Container(
                        child: getBody(question, color),
                      ),
                    ],
                  )
                : question.results.categories.length > 0
                    ? WordCloud.getWordCloud(context, question)
                    : SizedBox()
          ],
        ),
      ),
    );
  }

  getBody(questionArray.Question question, Color color) {
    if (selectedTab == 0 && question.resultsByGender.length != 0) {
      return StatisticsAll.getAllStatistics(question, color);
    } else if (selectedTab == 1 && question.resultsByLocation.length != 0) {
      return StatisticsAge.getAgeStatistics(question, color);
    } else if (selectedTab == 2 && question.resultsByGender.length != 0) {
      return StatisticsGender.getGenderStatistics(question, color);
    } else if (selectedTab == 3 && question.resultsByAge.length != 0) {
      return StatisticsLocationSpinner(question, color);
    }
  }
}
