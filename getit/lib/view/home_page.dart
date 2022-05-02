import 'package:flutter/material.dart';
import 'package:getit/services/location_service.dart';
import 'package:getit/services/locator.dart';

class HomePage extends StatelessWidget {
   HomePage({ Key? key }) : super(key: key);

  var locationService = getIt<LocationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{

            locationService.getLocation();
        },
        child: Icon(Icons.upload_file),
      ),
    );
  }
}