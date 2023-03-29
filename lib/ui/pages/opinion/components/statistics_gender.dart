import 'package:flutter/material.dart';
import 'package:ureport_ecaro/ui/pages/opinion/components/custom_linear_indicator.dart';

import '../../../../models/response_opinions.dart' as questionArray;

class StatisticsGender {
  static Widget getGenderStatistics(
      questionArray.Question question, Color color) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: question.resultsByGender.length,
        itemBuilder: (context, index1) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 3, top: 10),
                child: Text(
                  "${question.resultsByGender[index1].label}",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: question.resultsByGender[index1].categories.length,
                  itemBuilder: (context, index) {
                    int set = question.resultsByGender[index1].resultsSet;
                    int count = question
                        .resultsByGender[index1].categories[index].count;

                    return Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: CustomLinearIndicator(
                                percent: set != 0 ? count / set : 0.0,
                                color: color,
                                label:
                                    "${question.resultsByGender[index1].categories[index].label}",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 4),
                              child: Text(
                                  "${((set != 0 ? count / set : 0.0) * 100).round()}%"),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          );
        });
  }
}
