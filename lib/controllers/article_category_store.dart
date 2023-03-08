import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/models/category.dart';

part 'article_category_store.g.dart';

class ArticleCategoryStore = _ArticleCategoryStoreBase
    with _$ArticleCategoryStore;

abstract class _ArticleCategoryStoreBase with Store {
  ObservableMap<String, List<Result>> mapOfItems = ObservableMap();
  final Map<String, List<Result>> initMap = {};

  _ArticleCategoryStoreBase(List<Result> result) {
    result.forEach((element) {
      if (mapOfItems.containsKey(element.name!.split('/')[1].trim())) {
        mapOfItems[element.name!.split('/')[1].trim()]!.add(element);
      } else {
        mapOfItems[element.name!.split('/')[1].trim()] = [element];
      }
    });
    initMap.addAll(mapOfItems);
  }

  @action
  void search(String searchKeywork) {
    if (searchKeywork.isNotEmpty) {
      // Search inside map by key. If key starts with searchkeyword, add it to the map
      mapOfItems.clear();
      initMap.forEach((key, value) {
        if (key.toLowerCase().startsWith(searchKeywork.toLowerCase())) {
          mapOfItems[key] = value;
        }
      });
    } else {
      mapOfItems.clear();
      mapOfItems.addAll(initMap);
    }
  }
}
