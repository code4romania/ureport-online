import 'package:flutter/material.dart';
import 'package:ureport_ecaro/ui/pages/opinion/components/custom_linear_indicator.dart';
import '../../../../models/response_opinions.dart' as questionArray;

class StatisticsAll {
  static Widget getAllStatistics(questionArray.Question question, Color color) {
    int set = question.results.resultsSet;
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: question.results.categories.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: CustomLinearIndicator(
                      percent: question.results.categories[index].count / set,
                      color: color,
                      label: "${question.results.categories[index].label}",
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
                        "${(question.results.categories[index].count / set * 100).round()}%"),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
