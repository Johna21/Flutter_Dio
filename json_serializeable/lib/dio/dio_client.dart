import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_serializeable/model/data.dart';
import 'package:json_serializeable/model/user.dart';

class DioClient{
  final Dio _dio = Dio(
    
  );
  static const _baseurl = 'https://jsonplaceholder.typicode.com/';
  static const _postendpoint = _baseurl+"posts";

  Future<Data?> getUser({required int id}) async{
    Data? user;
    try{
      final response = await _dio.get(_postendpoint +"/$id");
      debugPrint(response.toString());

      return Data.fromJson(response.data);
    }on DioError catch(e){
      if(e.response !=null){
        print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
      }else{
        print('Error sending request!');
      print(e.message);
      }
    }
    return user;
  }

}