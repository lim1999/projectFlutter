import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutterchat/model/post.dart';
import 'package:flutterchat/screen/detail_screen.dart';
import 'package:flutterchat/widget/CustomProgressIndicator.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool _isloading;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text("List Screen"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: FutureBuilder<List<Post>>(
          future: _loadData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) print("snapshot:${snapshot.hasError}");
            if (snapshot.connectionState == ConnectionState.done) {
              final dataLoad = snapshot.data;
              return ListView.builder(
                itemCount: dataLoad.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            title: dataLoad[index].title,
                            body: dataLoad[index].body,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ0YL8JMFhbNpp76cO92s_I9TRSxgGXVTv4Vg&usqp=CAU",
                                width: 150.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataLoad[index].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      dataLoad[index].body,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                      softWrap: true,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return CustomProgressindicator();
          },
        ),
      ),
    );
  }

  Future<List<Post>> _loadData() async {
    setState(() {
      _isloading = true;
    });
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      return json
          .decode(response.body)
          .map<Post>((json) => Post.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
