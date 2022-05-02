

import 'package:get_it/get_it.dart';
import 'package:getit/models/location_model.dart';
import 'package:getit/services/location_service.dart';

GetIt getIt = GetIt.instance;
void locator(){
  getIt.registerLazySingleton(() => LocationModel);

  getIt.registerFactory(() => LocationService);

}