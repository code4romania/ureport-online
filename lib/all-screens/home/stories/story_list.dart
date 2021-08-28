import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/all-screens/home/stories/model/response-story-data.dart';
import 'package:ureport_ecaro/all-screens/home/stories/stories-details.dart';
import 'package:ureport_ecaro/all-screens/home/stories/story-controller.dart';
import 'package:provider/provider.dart';
import 'package:ureport_ecaro/utils/api_constant.dart';
import 'package:ureport_ecaro/utils/nav_utils.dart';
import 'package:ureport_ecaro/widgets/CNetworkImage.dart';
import 'model/ResponseStoryLocal.dart';
import 'model/response-story-data.dart' as storyarray;

class StoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<StoryController>(context, listen: false).initializeDatabase();
    List<ResultLocal>? stories = [];
    Provider.of<StoryController>(context, listen: false).getStoriesFromLocal();
    Provider.of<StoryController>(context, listen: false)
        .getStoriesFromRemote(ApiConst.RESULT_STORY_BASEURL);

    return Consumer<StoryController>(builder: (context, provider, snapshot) {
      return SafeArea(
          child: Scaffold(
              body: provider.isloading? Center(child: CircularProgressIndicator()): Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("assets/images/bg_home.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
                margin: EdgeInsets.only(top: 10),
                child: Image(
                    fit: BoxFit.fill,
                    height: 35,
                    width: 160,
                    image: AssetImage('assets/images/ureport_logo.png')),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(top: 20, bottom: 15),
                child: Text(
                  "Stories",
                  style: TextStyle(
                      fontSize: 24.0, color: Colors.black, fontFamily: 'Dosis'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Divider(
                  height: 1.5,
                  color: Colors.grey[600],
                ),
              ),
              Expanded(
                child: FutureBuilder<List<ResultLocal>>(
                    future: provider.getStoriesFromLocal(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        stories = List.from(snapshot.data!.reversed);
                        if(stories!.length == 0){
                          provider.isloading = true;
                        }else{
                          provider.isloading = false;
                        }
                      }
                      return ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          addAutomaticKeepAlives: true,
                          itemCount: stories!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                NavUtils.push(context, StoryDetails(stories![index].id.toString()));
                              },
                              child: Container(
                                child: getItem(
                                    stories?[index].images != ''
                                        ? stories![index].images
                                        : "assets/images/default.jpg",
                                    "",
                                    stories![index].title,
                                    stories![index].summary),
                              ),
                            );
                          });
                    }),
              ),
            ],
          ),
        ),
      )));
    });
  }
}

getBackground() {
  return Image(image: AssetImage("assets/images/bg_home.png"));
}

getItem(String image_url, String date, String title, String summery) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.only(top: 10, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        getItemTitleImage(image_url),
        getItemDate(date),
        getItemTitle(title),
        getItemSummery(summery),
      ],
    ),
  );
}
//test

getItemTitleImage(String image_url) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    child: CachedNetworkImage(

        height: 200,
        fit: BoxFit.cover,
        imageUrl: image_url,
        progressIndicatorBuilder: (context, url, downloadProgress) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 40, width: 40, child: CircularProgressIndicator()),
                SizedBox(
                  height: 10,
                ),
                Text("Loading")
              ],
            ),
        errorWidget: (context, url, error) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("No image found")
              ],
            )),
  );
}

getItemDate(String date) {
  return Container(
    padding: EdgeInsets.only(top: 10, left: 10),
    child: Text(
      date,
      style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
    ),
  );
}

getItemTitle(String title) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

getItemSummery(String summery) {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    child: Text(
      summery,
      style: TextStyle(fontSize: 14),
    ),
  );
}