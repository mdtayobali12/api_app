import 'dart:convert';

import 'package:api_app/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<PostModel> postList = [];

Future<List<PostModel>> getPostApi() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map i in data) {
      postList.add(PostModel.fromJson(i));
    }
    return postList;
  } else {
    return postList;
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        title: const Text("Api Course"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text("Loading......");
                } else {
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(index.toString()),
                            Text(postList[index].title.toString())
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
