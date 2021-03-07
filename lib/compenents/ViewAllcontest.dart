import 'dart:async';

import 'package:cptime/constants/colorprofile.dart';
import 'package:cptime/model/Contest.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewAllcontest extends StatefulWidget {
  final String s;
  List<Contest> contest;
  ViewAllcontest(this.contest, this.s);
  _ViewAllcontestState createState() => _ViewAllcontestState();
}

class _ViewAllcontestState extends State<ViewAllcontest> {
  final _debouncer = Debouncer(milliseconds: 500);
  List<Contest> filteredContest;
  bool issetOnce = false;
  Widget build(BuildContext context) {
    if (!issetOnce)
      setState(() {
        issetOnce = true;
        filteredContest = widget.contest;
      });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelStyle: TextStyle(),
              hintStyle: TextStyle(
                fontSize: 20.0,
              ),
              border: OutlineInputBorder(),
              prefixIcon: const Icon(
                Icons.search,
              ),
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Filter by name or platform',
            ),
            onChanged: (string) {
              print(string);
              _debouncer.run(() {
                setState(() {
                  filteredContest = widget.contest
                      .where((u) => (u.name
                              .toLowerCase()
                              .contains(string.toLowerCase()) ||
                          u.platform
                              .toLowerCase()
                              .contains(string.toLowerCase())))
                      .toList();
                });
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContest.length,
              padding: const EdgeInsets.all(2.0),
              itemBuilder: (context, position) {
                print(filteredContest.length);
                String starttime = filteredContest[position]
                    .startTime
                    .toUtc()
                    .toIso8601String()
                    .replaceAll('-', '')
                    .replaceAll(':', '')
                    .replaceAll('.', '');
                String endtime = filteredContest[position]
                    .endTime
                    .toUtc()
                    .toIso8601String()
                    .replaceAll('-', '')
                    .replaceAll(':', '')
                    .replaceAll('.', '');
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        subtitle: Text(
                          '${filteredContest[position].name}',
                          style: GoogleFonts.roboto(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          '${filteredContest[position].platform.toUpperCase()}',
                          style: GoogleFonts.roboto(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        '${DateFormat.yMMMMEEEEd().add_jm().format(filteredContest[position].startTime)}',
                        style: GoogleFonts.roboto(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${DateFormat.yMMMMEEEEd().add_jm().format(filteredContest[position].endTime)}',
                        style: GoogleFonts.roboto(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      (filteredContest[position].when != "ongoing")
                          ? TextButton(
                              child: Text(
                                'remind me',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () => {
                                launch(
                                    'https://calendar.google.com/event?action=TEMPLATE&dates=' +
                                        Uri.encodeFull(starttime) +
                                        'Z/' +
                                        Uri.encodeFull(endtime) +
                                        'Z&text=' +
                                        Uri.encodeFull(
                                            filteredContest[position].name) +
                                        '&location=' +
                                        filteredContest[position].url)
                              },
                            )
                          : TextButton(
                              child: Text(
                                'Start Coding',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () =>
                                  {launch(filteredContest[position].url)},
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
