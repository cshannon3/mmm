

import 'package:de_makes_final/state/app_state.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerSingleton(AppState());
} 
 // locator.registerSingleton(AuthState());
  //locator.registerSingleton(DataRepo(gmanager));
  //locator.registerSingleton(DocsRepo(gmanager));
//https://www.burkharts.net/apps/blog/lets-get-this-party-started-startup-orchestration-with-getit/
// check async