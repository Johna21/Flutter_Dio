import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_serializeable/dio/dio_client.dart';
import 'package:json_serializeable/model/data.dart';
import 'package:json_serializeable/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DioClient _dioClient;
  int requesting = 0;

  @override
  void initState() {
    super.initState();
    _dioClient = DioClient();
  }

  @override
  Widget build(BuildContext context) {
    Future<Data?> post = _dioClient.getUser(id: 1);
    Future<Data?> createpost =
        _dioClient.createUser(
          userId: 1, 
          title: "title", 
          body: "body");
    Future<Data?> updatepost =
        _dioClient.updateUser(
          postId: 1,
          userId: 1, 
          title: "updated", 
          body: "body"
          );

    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                if (requesting == 1) ...[
                  FutureBuilder<Data?>(
                    future: post,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(snapshot.data!.title),
                            SizedBox(height: 8.0),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.hasError}");
                      }

                      return Container();
                    },
                  ),
                ] else if (requesting == 2) ...[
                  FutureBuilder<Data?>(
                    future: createpost,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(snapshot.data!.userId.toString()),
                            SizedBox(height: 8.0),
                            Text(snapshot.data!.title),
                            SizedBox(height: 8.0),
                            Text(snapshot.data!.body),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.hasError}");
                      }

                      return Container();
                    },
                  ),
                ] else if (requesting == 3) ...[
                  FutureBuilder<Data?>(
                    future: updatepost,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(snapshot.data!.userId.toString()),
                            SizedBox(height: 8.0),
                            Text(snapshot.data!.title),
                            SizedBox(height: 8.0),
                            Text(snapshot.data!.body),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.hasError}");
                      }

                      return Container();
                    },
                  ),
                ]
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      requesting = 1;
                    });
                  },
                  child: Text("Get Post")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      requesting = 2;
                    });
                  },
                  child: Text("Create Post")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      requesting = 3;
                    });
                  },
                  child: Text("Update Post")),
            ],
          )
        ],
      ),
    );
  }
}
