import 'package:get_it/get_it.dart';
import 'package:ureport_ecaro/repository/network_operation/http_service.dart';
import 'package:ureport_ecaro/repository/rapidpro_service.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<SPUtil>(() => SPUtil());
  locator.registerLazySingleton<HttpService>(() => HttpService());
  locator.registerLazySingleton<RapidProService>(() => RapidProService());
}
