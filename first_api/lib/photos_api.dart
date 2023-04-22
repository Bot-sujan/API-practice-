import 'dart:async';
import 'dart:convert';

import 'package:first_api/models/photos_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyPhotos extends StatefulWidget {
  const MyPhotos({super.key});

  @override
  State<MyPhotos> createState() => _MyPhotosState();
}

List<Photosmodel> photosList = [];

Future<List<Photosmodel>> getPhotosApi () async {
            final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
            var data = jsonDecode(response.body.toString());
            if(response.statusCode == 200) {
                for(Map i in data) {
                  photosList.add(Photosmodel.fromJson(i));
                }
                return photosList;
            } else {
                return photosList;
            }
            }

class _MyPhotosState extends State<MyPhotos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotosApi(),
              builder:  (context, AsyncSnapshot<List<Photosmodel>> snapshot) {
                  return ListView.builder(
                    itemCount: photosList.length,
                    itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                          ),
                          title: Text('Notes ID: ' + snapshot.data![index].id.toString()),
                          subtitle: Text(snapshot.data![index].title.toString()),
                        );
                  },);
                
                  }),
          ),
           
          
  ]),
        
    );
  }
}