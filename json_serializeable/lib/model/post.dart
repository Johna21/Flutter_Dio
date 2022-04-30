
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()

class PostInfo {
  String name;
  String job;
  String? id;
  String? createdAt;
  String? updatedAt;
  PostInfo({
    required this.name,
    required this.job,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory PostInfo.fromJson(Map<String,dynamic> json)=>_$PostInfoFromJson(json);
  Map<String,dynamic> toJson()=>_$PostInfoToJson(this);
}
