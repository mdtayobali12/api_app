import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFor extends StatefulWidget {
  const ExampleFor({super.key});

  @override
  State<ExampleFor> createState() => _ExampleForState();
}

class _ExampleForState extends State<ExampleFor> {
  var data;

  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api course"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                } else {
                  return ListView.builder(
                    itemCount:data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child:Column(
                          children: [
                            ReusebleRow(title: 'name', value: data[index]['name'].toString()),
                            ReusebleRow(title: 'username', value: data[index]['username'].toString()),
                            ReusebleRow(title: 'address', value: data[index]['address']['street'].toString()),
                            ReusebleRow(title: 'address', value: data[index]['address']['geo']['lat'].toString()),
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

class ReusebleRow extends StatelessWidget {
  ReusebleRow({super.key, required this.title, required this.value});

  String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}