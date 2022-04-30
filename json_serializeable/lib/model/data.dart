

import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()

class Data {
  final int userId;
  final int id;
  final String title;
  final String body;

  Data(
    this.userId, 
    this.id, this.title, 
    this.body, 
    
  );
factory Data.fromJson(Map<String,dynamic> json)=>_$DataFromJson(json);
Map<String,dynamic> toJson()=>_$DataToJson(this);
  
}
