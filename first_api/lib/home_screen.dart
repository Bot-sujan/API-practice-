import 'dart:convert';
import 'package:first_api/models/post_model.dart';
import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

List<PostModel>  postList = [];

Future<List<PostModel>> getPostApi () async {
 final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
List data  = jsonDecode (response.body.toString());

 if (response.statusCode == 200) {
  for(Map i in data) {
    postList.add(PostModel.fromJson(i));
  }
  return postList;

 }   else {
       return postList;
 }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api'),
      ),
      body: Column(
        children:  [
          FutureBuilder(
            future: getPostApi(),
            builder: (context,  snapshot){
                 if(!snapshot.hasData) {
                  return const Text ('Loading');
                 } else {
                    return Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                              return  Card(
                                 child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                   child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(postList[index].title.toString()),
                                      Text(postList[index].body.toString()),

                                    ],
                                   ),
                                 ),
                              );
                                       }),
                    );
                 }
            }
            )
        ],
      ),
    );
  }
}
