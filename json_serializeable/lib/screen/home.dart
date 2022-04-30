import 'dart:ffi';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_serializeable/dio/dio_client.dart';
import 'package:json_serializeable/model/data.dart';
import 'package:json_serializeable/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late DioClient _dioClient;
  late Future<Data?> post;


  @override
  void initState(){
    super.initState();
    _dioClient = DioClient();
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Column(
        children: [
          Center(
            child: FutureBuilder<Data?>(
              future: post,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  
                    return Column(
                        mainAxisSize: MainAxisSize.min,

                      children: [
                        Text(snapshot.data!.title),
                        SizedBox(height: 8.0),
                        
                      ],
                    
                    );
                  
                }else if(snapshot.hasError){
                  return Text("${snapshot.hasError}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          ElevatedButton(
            onPressed: (){
              post = _dioClient.getUser(id: 1);
            }, 
            child: Text("Get Post")
            )
        ],
      ),
    );
  }
  
}
