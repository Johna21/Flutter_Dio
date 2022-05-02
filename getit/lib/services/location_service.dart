import 'dart:async';

import 'package:flutter/services.dart';
import 'package:getit/models/location_model.dart';
import 'package:location/location.dart';

class LocationService{

  Location location = Location();
  LocationModel? currentLocation;

  StreamController<LocationModel> locationController = StreamController<LocationModel>.broadcast();
  Stream<LocationModel> get getData=>locationController.stream;


  LocationService(){
    location.requestPermission().then((permissionStatus) {
      if(permissionStatus == PermissionStatus.granted){
        location.onLocationChanged.listen((locationData) { 

          locationController.add(LocationModel(
            latitude: locationData.latitude, 
            longitude: locationData.longitude
            ));

        });
      }
    });
  }

  Future<LocationModel?> getLocation() async{
    try{
      var userlocation = await location.getLocation();
      currentLocation = LocationModel(
        latitude: userlocation.latitude, 
        longitude: userlocation.longitude);
        print(currentLocation);
    }catch(e){

      if(e is PlatformException){
        print(e.message);
      }

    }

    return currentLocation;
  }

}