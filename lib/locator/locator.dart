import 'package:get_it/get_it.dart';
import 'package:ureport_ecaro/services/opinions_service.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
import '../services/network_operation/http_service.dart';
import '../services/network_operation/rapidpro_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<SPUtil>(() => SPUtil());
  locator.registerLazySingleton<HttpService>(() => HttpService());
  locator.registerLazySingleton<RapidProService>(() => RapidProService());
  locator.registerLazySingleton<OpinionRepository>(() => OpinionRepository());
}
