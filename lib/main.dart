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
      title: "CpTime",
      darkTheme: ThemeData.dark(),
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
        builder: (context) => Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          margin: EdgeInsets.all(16),
          child: ListView(
            children: [
              
              Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(5.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                semanticContainer: true,
                color: Colors.grey[900],
                child: Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(width: 2, color: Colors.cyan),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/upcoming');
                    },
                    child: Text('upcoming'),
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.grey[900],
                child: Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(width: 2, color: Colors.cyan),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/ongoing');
                    },
                    child: Text('ongoing'),
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.grey[900],
                child: Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(width: 2, color: Colors.cyan),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/kaggle');
                    },
                    child: Text('kaggle'),
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.grey[900],
                child: Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(width: 2, color: Colors.cyan),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/hackerearth');
                    },
                    child: Text('hackerearth'),
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.grey[900],
                child: Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(width: 2, color: Colors.cyan),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/atcoder');
                    },
                    child: Text('atcoder'),
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.grey[900],
                child: Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(width: 2, color: Colors.cyan),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/codeforces');
                    },
                    child: Text('codeforces'),
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.grey[900],
                child: Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(width: 2, color: Colors.cyan),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/leetcode');
                    },
                    child: Text('leetcode'),
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.grey[900],
                child: Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(width: 2, color: Colors.cyan),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/topcoder');
                    },
                    child: Text('topcoder'),
                  ),
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.grey[900],
                child: Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(width: 2, color: Colors.cyan),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/codechef');
                    },
                    child: Text('codechef'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
