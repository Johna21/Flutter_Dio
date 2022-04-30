

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';


@JsonSerializable()

class User {
  String name;
  String email;
  User({
    required this.name,
    required this.email,
  });
  

  

  factory User.fromJson(Map<String, dynamic> map) =>_$UserFromJson(map);

  Map<String,dynamic> toJson()=>_$UserToJson(this);
}
