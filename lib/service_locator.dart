

//import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/forms/form_manager.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/state/data_repo.dart';
import 'package:delaware_makes/state/docs_repo.dart';
import 'package:delaware_makes/state/platform_state.dart';
import 'package:get_it/get_it.dart';
GetIt locator = GetIt.instance;
 
void setupLocator() async {
  locator.registerSingleton(DataRepo());
  locator.registerSingleton(DocsRepo());
  locator.registerSingleton(AppState());
  locator.registerSingleton(PlatformInfo());
  locator.registerSingleton(FormManager());
} 

//https://www.burkharts.net/apps/blog/lets-get-this-party-started-startup-orchestration-with-getit/
// check async
