import 'dart:async';
import 'dart:convert';
import 'package:cptime/main.dart';
import 'package:cptime/microservice/timeGetter.dart';
import 'package:cptime/model/Contest.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/Contest.dart';

Future<List<Contest>> fetchContest() async {
  final response = await http.get(Uri.https('cplistapi.herokuapp.com', '/'));
  if (response.statusCode == 200) {
    Map<String, dynamic> data =
        json.decode(response.body) as Map<String, dynamic>;
    List<Contest> items = [];
    for (var i = 0; i < data["results"]["ongoing"].length; i++) {
      // print(data["results"]["ongoing"][i]["name"].trimLeft().trimRight());
      Contest tmp = Contest(
          data["results"]["ongoing"][i]["name"].trimLeft().trimRight(),
          data["results"]["ongoing"][i]["url"],
          data["results"]["ongoing"][i]["platform"],
          getUnixTime(data["results"]["ongoing"][i]["startTime"]),
          getUnixTime(data["results"]["ongoing"][i]["endTime"]),
          "ongoing");
      items.insert(0, tmp);
    }
    for (var i = 0; i < data["results"]["upcoming"].length; i++) {
      // print(data["results"]["upcoming"][i]["name"].trimLeft().trimRight());
      Contest tmp = Contest(
          data["results"]["upcoming"][i]["name"].trimLeft().trimRight(),
          data["results"]["upcoming"][i]["url"],
          data["results"]["upcoming"][i]["platform"],
          getUnixTime(data["results"]["upcoming"][i]["startTime"]),
          getUnixTime(data["results"]["upcoming"][i]["endTime"]),
          "upcoming");
      items.insert(0, tmp);
    }
    print(items.length);
    return items;
  } else {
    print('dataFetchfailed');
  }
}
