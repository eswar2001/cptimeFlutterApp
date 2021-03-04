import 'package:flutter/material.dart';
import './model/Contest.dart';
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
      color: Colors.black,
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
      home: Builder(
        builder: (context) => Center(
          child: ListView(
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
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/kaggle');
                },
                child: Text('kaggle'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/hackerearth');
                },
                child: Text('hackerearth'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/atcoder');
                },
                child: Text('atcoder'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/codeforces');
                },
                child: Text('codeforces'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/leetcode');
                },
                child: Text('leetcode'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/topcoder');
                },
                child: Text('topcoder'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
