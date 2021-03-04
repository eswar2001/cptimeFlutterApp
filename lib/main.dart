import 'package:cptime/model/Contest.dart';
import 'package:cptime/routes/codechef.dart';
import 'package:flutter/material.dart';
import './services/service.dart';
import 'compenents/ViewAllcontest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<List<Contest>> futureContest;

  @override
  void initState() {
    super.initState();
    futureContest = fetchContest();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/upcoming': (BuildContext context) => FirstRoute(futureContest),
        '/ongoing': (BuildContext context) => SecondRoute(futureContest),
        '/codechef': (BuildContext context) => Codechef(futureContest),
      },
      home: Builder(
        builder: (context) => ListView(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/upcoming');
              },
              child: Text('upcoming'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ongoing');
              },
              child: Text('ongoing'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/codechef');
              },
              child: Text('codechef'),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FirstRoute extends StatefulWidget {
  Future<List<Contest>> futureContest;
  FirstRoute(this.futureContest);

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: FutureBuilder(
        future: widget.futureContest,
        builder: (context, snapshot) {
          // print(snapshot);
          return snapshot.data != null
              ? ViewAllcontest(snapshot.data, "upcoming")
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class SecondRoute extends StatefulWidget {
  Future<List<Contest>> futureContest;
  SecondRoute(this.futureContest);

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: FutureBuilder(
        future: widget.futureContest,
        builder: (context, snapshot) {
          // print(snapshot);
          return snapshot.data != null
              ? ViewAllcontest(snapshot.data, "ongoing")
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
// ViewBycontest
