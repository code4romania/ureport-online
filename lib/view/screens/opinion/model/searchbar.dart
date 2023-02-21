class OpinionSearchList {
  String title;
  List<OpinionSearchItem> children;

  OpinionSearchList(this.title, this.children);
}

class OpinionSearchItem {
  String title;
  String date;
  int id;
  String value;
  OpinionSearchItem(this.id, this.title, this.date, {this.value = ""});
}
