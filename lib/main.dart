import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import './model/Contest.dart';
import 'compenents/button.dart';
import 'routes/Platform.dart';
import './routes/ongoing.dart';
import './routes/upcoming.dart';
import './services/service.dart';
import 'package:splashscreen/splashscreen.dart';

// ignore: avoid_init_to_null
Future<List<Contest>> futureContest = null;
void main() {
  futureContest = fetchContest();
  runApp(MaterialApp(
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ),
    ),
    debugShowCheckedModeBanner: false,
    home: splashScreen(),
  ));
}

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    if (futureContest == null)
      return SplashScreen(
          seconds: 10,
          navigateAfterSeconds: MyApp(),
          title: Text(
            'CpTime',
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50.0),
          ),
          loadingText: Text(
            'Make it work, make it right, make it fast.',
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                fontSize: 20.0),
          ),
          backgroundColor: Colors.black,
          styleTextUnderTheLoader: GoogleFonts.roboto(),
          onClick: () => print(""),
          loaderColor: Colors.cyan);
    else {
      return SplashScreen(
          seconds: 3,
          navigateAfterSeconds: MyApp(),
          title: Text(
            'CpTime',
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50.0),
          ),
          loadingText: Text(
            'Make it work, make it right, make it fast.',
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                fontSize: 20.0),
          ),
          backgroundColor: Colors.black,
          styleTextUnderTheLoader: GoogleFonts.roboto(),
          onClick: () => print(""),
          loaderColor: Colors.cyan);
    }
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
