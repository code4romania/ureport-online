import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/utils/click_sound.dart';
import 'package:ureport_ecaro/utils/resources.dart';
import 'package:ureport_ecaro/view/screens/articles/categories/components/search_bar_widget.dart';
import 'package:ureport_ecaro/view/screens/articles/categories/models/category.dart';
import 'package:ureport_ecaro/view/screens/articles/shared/title_description_widget.dart';
import 'package:ureport_ecaro/view/screens/articles/shared/top_header_widget.dart';

class CategoryListScreen extends StatefulWidget {
  //This screen is only for Romania region

  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen>
    with AutomaticKeepAliveClientMixin {
  List<Result> initCategoryList = [];
  List<Result> finalCategoryList = [];

  void searchList(String? value) {
    //initCategoryList
    if (value != null && value.isNotEmpty) {
      List<Result> tempList = [];
      for (int i = 0; i < initCategoryList.length; i++) {
        if (initCategoryList[i]
            .title
            .toLowerCase()
            .startsWith(value.toLowerCase())) {
          tempList.add(initCategoryList[i]);
        }
      }
      setState(() {
        finalCategoryList = tempList;
      });
      tempList = [];
    } else {
      setState(() {
        finalCategoryList = initCategoryList;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopHeaderWidget(title: "Cateogrii"),
          Container(
            child: Divider(
              height: 1,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SearchBarWidget(onSearchChanged: searchList),
          SizedBox(
            height: 10,
          ),
          TitleDescriptionWidget(
            title: "Categorii",
            description:
                "Navighează prin categoriile de mai jos, alege ce te pasionează și câștigă puncte pentru a deveni cel mai bun! ",
          ),
          FutureBuilder<List<Result>>(
              //TODO: FUTURE GET CATEGORIES
              //future:// getInitCategories(),
              builder: (context, snapshot) {
            if (snapshot.hasData) {
              finalCategoryList = snapshot.data!;
              initCategoryList = snapshot.data!;
            }
            return finalCategoryList.length != 0
                ? Container(
                    color: AppColors.white,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        onTap: () {
                          ClickSound.soundTap();

                          //TODO: GOTO ARTICLE LIST
                          // NavUtils.push(
                          //     context,
                          //     ArticlesListView(
                          //         title: finalCategoryList[index].title,
                          //         list:
                          //             finalCategoryList[index].children));
                        },
                        child: getItem(
                          finalCategoryList[index],
                        ),
                      ),
                      itemCount: finalCategoryList.length,
                    ),
                  )
                : Column(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 40,
                          color: Colors.white,
                          child: Center(
                              child: Text(
                            "No result found",
                            style: TextStyle(fontSize: 15),
                          ))),
                    ],
                  );
          })
        ],
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;

  getItem(
    Result item,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          getItemTitleImage(item.category.imageUrl),
          Container(
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
            child: Text(
              item.title.toString(),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  getItemTitleImage(String? image_url) {
    return image_url != null
        ? Container(
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            height: 240,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: CachedNetworkImage(
                height: 200,
                width: 300,
                fit: BoxFit.fitWidth,
                imageUrl: image_url,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
                errorWidget: (context, url, error) => Container(
                    color: AppColors.errorWidgetBack,
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                    )),
              ),
            ),
          )
        : Container(
            child: Image(
              image: AssetImage("assets/images/default.jpg"),
              fit: BoxFit.fill,
            ),
          );
  }
}
