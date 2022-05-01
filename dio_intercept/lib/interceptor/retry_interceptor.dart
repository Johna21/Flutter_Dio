
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_intercept/interceptor/dio_connectivity_request_retry.dart';

class RetryConnectionChangeInterceptor extends Interceptor{

  final DioConnectivityRequestRetrier requestRetrier;

  RetryConnectionChangeInterceptor({required this.requestRetrier});

@override
Future onErrorvalue(DioError err) async{


  if(_shouldRetry(err)){

    try{
      return requestRetrier.scheduleRequestRetry(err.requestOptions);
    }catch(e){
      return e;
    }

  }else
 {
   return err;}
}

  bool _shouldRetry(DioError err){
    return err.type == DioErrorType.cancel &&
                      err.error !=null &&
                      err.error is SocketException;
  }

}