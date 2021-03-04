import 'package:cptime/model/Contest.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

Widget ViewAllcontest(List<Contest> contest, String s) {
  List<Contest> temporary = List<Contest>.from(contest);
  temporary.sort((a, b) => b.startTime.compareTo(a.startTime));
  temporary.removeWhere((item) => item.when != s);
  return Container(
    color: Colors.black,
    child: ListView.builder(
      itemCount: temporary.length,
      padding: const EdgeInsets.all(2.0),
      itemBuilder: (context, position) {
        String starttime = temporary[position]
            .startTime
            .toUtc()
            .toIso8601String()
            .replaceAll('-', '')
            .replaceAll(':', '')
            .replaceAll('.', '');
        String endtime = temporary[position]
            .endTime
            .toUtc()
            .toIso8601String()
            .replaceAll('-', '')
            .replaceAll(':', '')
            .replaceAll('.', '');
        return Card(
          color: temporary[position].startTime.isBefore(DateTime.now())
              ? Colors.orange
              : Colors.blueAccent,
          child: Column(
            children: [
              ListTile(
                subtitle: Text(
                  '${temporary[position].name}',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                title: Text(
                  '${temporary[position].platform.toUpperCase()}',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '${DateFormat.yMMMMEEEEd().add_jm().format(temporary[position].startTime)}',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${DateFormat.yMMMMEEEEd().add_jm().format(temporary[position].endTime)}',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              (temporary[position].when != "ongoing")
                  ? TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      child: Text(
                        'remind me',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => {
                        launch(
                            'https://calendar.google.com/event?action=TEMPLATE&dates=' +
                                Uri.encodeFull(starttime) +
                                'Z/' +
                                Uri.encodeFull(endtime) +
                                'Z&text=' +
                                Uri.encodeFull(temporary[position].name) +
                                '&location=' +
                                temporary[position].url)
                      },
                    )
                  : TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      child: Text(
                        'Start Coding',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => {launch(temporary[position].url)},
                    ),
            ],
          ),
        );
      },
    ),
  );
}
