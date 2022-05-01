import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_intercept/interceptor/dio_connectivity_request_retry.dart';
import 'package:dio_intercept/interceptor/retry_interceptor.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Dio? dio;
  String? firstPostTitle;
  bool? 
  
  
  isLoading;

  @override
  void initState(){
    super.initState();
    dio = Dio();
    firstPostTitle = 'Press the button';
    isLoading = false;

    dio!.interceptors.add(
      RetryConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: dio!,
          connectivity: Connectivity()
        )
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio Intercept"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(isLoading == true)
            CircularProgressIndicator()
            else
            Text(
              firstPostTitle!,
            ),
            ElevatedButton(
              onPressed: () async{
                setState(() {
                  isLoading =true;
                });
                final response = 
                await dio!.get("https://jsonplaceholder.typicode.com/posts");
                setState(() {
                  isLoading = false;
                  firstPostTitle = response.data[0]['title'] as String;
                  
                });
              }, 
              child: Text("Get Request")
              )
          ],
        ),
      ),
    );
  }
}