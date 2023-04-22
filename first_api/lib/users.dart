import 'dart:convert';

import 'package:first_api/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

List<UsersModel> usersList = [];

Future<List<UsersModel>> getUsersApi() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (Map i in data) {
      usersList.add(UsersModel.fromJson(i));
    }
    return usersList;
  } else {
    return usersList;
  }
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUsersApi(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                           Reusasble(title: 'Name', value: snapshot.data![index].name.toString()),
                            Reusasble(title: 'UserName', value: snapshot.data![index].username.toString()),
                            Reusasble(title: 'Email', value: snapshot.data![index].email .toString()),

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

class Reusasble extends StatelessWidget {

  String title, value;
   Reusasble({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(title),
           Text(value),
        ],
      ),
    );
  }
}
