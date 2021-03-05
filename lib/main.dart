import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './model/Contest.dart';
import 'compenents/button.dart';
import 'routes/Platform.dart';
import './routes/ongoing.dart';
import './routes/upcoming.dart';
import './services/service.dart';

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
      title: "CpTime",
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/upcoming': (BuildContext context) => Upcoming(futureContest),
        '/ongoing': (BuildContext context) => Ongoing(futureContest),
        '/codechef': (BuildContext context) =>
            platform(futureContest, "codechef"),
        '/kaggle': (BuildContext context) => platform(futureContest, "kaggle"),
        '/hackerearth': (BuildContext context) =>
            platform(futureContest, "hackerearth"),
        '/atcoder': (BuildContext context) =>
            platform(futureContest, "atcoder"),
        '/codeforces': (BuildContext context) =>
            platform(futureContest, "codeforces"),
        '/leetcode': (BuildContext context) =>
            platform(futureContest, "leetcode"),
        '/topcoder': (BuildContext context) =>
            platform(futureContest, "topcoder"),
      },
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              button('hackerearth'),
              button('kaggle'),
              button('atcoder'),
              button('codeforces'),
              button('leetcode'),
              button('topcoder'),
              button('codechef'),
              button('upcoming'),
              button('ongoing'),
            ],
          ),
        ),
      ),
    );
  }
}
