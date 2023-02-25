import 'package:ureport_ecaro/utils/sp_utils.dart';
import '../services/database_service.dart';
import '../locator/locator.dart';
import '../services/network_operation/data_loader_service.dart';
import '../services/click_sound_service.dart';
import 'connectivity_controller.dart';
import '../models/response_opinions.dart' as opinionsarray;
import '../services/opinions_service.dart';

class OpinionController extends ConnectivityController {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  var sp = locator<SPUtil>();

  int opinionID = 0;
  bool isLoaded = true;
  var noResultFound = false;

  setOpinionId(int id) {
    opinionID = id;
    notifyListeners();
  }

  var isExpanded = false;

  void setExpanded(bool state) {
    isExpanded = state;
  }

  var isLoading = false;
  var isSyncing = false;

  setLoading() {
    isLoading = true;
    notifyListeners();
  }

  setSyncing() {
    isSyncing = true;
    notifyListeners();
  }

  var _opinionrepository = locator<OpinionRepository>();
  List<opinionsarray.Result> items = [];

  checkOpinion(String url, String program) async {
    _databaseHelper.getOpinionCount(program).then((value) => {
          if (value == 0)
            {getLatestOpinionFromRemote(url, program)}
          else if (value == 1)
            {setSyncing(), getAllOpinions(url, program)}
          else
            {refreshOpinion(url, program)}
        });
  }

  getAllOpinions(String url, String program) {
    setLoading();
    getOpinionsFromRemote(url + "?limit=40", program);
  }

  getOpinionsFromRemote(String url, String program) async {
    var apiresponsedata = await _opinionrepository.getOpinions(url);
    if (apiresponsedata.httpCode == 200) {
      items.addAll(apiresponsedata.data.results);
      if (apiresponsedata.data.next != null) {
        getOpinionsFromRemote(apiresponsedata.data.next, program);
      } else {
        await _databaseHelper.insertOpinion(items, program);
        LoadDataHandling.storeOpinionLastUpdate();
        isLoading = false;
        isSyncing = false;
        notifyListeners();
      }
    }
  }

  getLatestOpinionFromRemote(String url, String program) async {
    var apiresponsedata =
        await _opinionrepository.getOpinions(url + "?limit=1");
    if (apiresponsedata.httpCode == 200) {
      items.addAll(apiresponsedata.data.results);
      sp.setValue("${sp.getValue(SPUtil.PROGRAMKEY)}_latest_opinion",
          items[0].id.toString());
      await _databaseHelper.insertOpinion(items, program);
      isLoading = false;
      isSyncing = true;
      notifyListeners();
      getAllOpinions(url, program);
    }
  }

  refreshOpinion(String url, String program) async {
    var apiresponsedata =
        await _opinionrepository.getOpinions(url + "?limit=1");
    if (apiresponsedata.httpCode == 200) {
      ClickSound.soundShare();
      await _databaseHelper.insertOpinion(
          apiresponsedata.data.results, program);
      sp.setValue("${sp.getValue(SPUtil.PROGRAMKEY)}_latest_opinion",
          apiresponsedata.data.results[0].id.toString());
      LoadDataHandling.storeOpinionLastUpdate();
      isLoading = false;
      isSyncing = false;
      notifyListeners();
    }
  }

  getOpinionsFromLocal(String program, int id) {
    return _databaseHelper.getOpinions(program, id);
  }

  getCategories(String program) {
    return _databaseHelper.getOpinionCategories(program);
  }

  notify() {
    notifyListeners();
  }
}
