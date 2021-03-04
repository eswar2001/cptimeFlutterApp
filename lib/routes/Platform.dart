import 'package:cptime/compenents/platform.dart';
import 'package:cptime/model/Contest.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
// ignore: must_be_immutable
class platform extends StatefulWidget {
  Future<List<Contest>> futureContest;
  String where;
  platform(this.futureContest, this.where);
  @override
  _platformState createState() => _platformState(where);
}

// ignore: camel_case_types
class _platformState extends State<platform> {
  String where;
  _platformState(this.where);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(where),
      ),
      body: FutureBuilder(
        future: widget.futureContest,
        builder: (context, snapshot) {
          // print(snapshot);
          return snapshot.data != null
              ? ViewBycontest(snapshot.data, where)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
