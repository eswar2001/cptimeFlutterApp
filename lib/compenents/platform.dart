import 'package:cptime/model/Contest.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';
import 'package:google_fonts/google_fonts.dart';

Widget ViewBycontest(List<Contest> contest, String s) {
  List<Contest> temporary = List<Contest>.from(contest);
  temporary.removeWhere((item) => item.platform != s);
  temporary.sort((a, b) => b.startTime.compareTo(a.startTime));
  return Container(
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
          child: Column(
            children: [
              ListTile(
                subtitle: Text(
                  '${temporary[position].name}',
                  style: GoogleFonts.roboto(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                title: Text(
                  '${temporary[position].platform.toUpperCase()}',
                  style: GoogleFonts.roboto(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '${DateFormat.yMMMMEEEEd().add_jm().format(temporary[position].startTime)}',
                style: GoogleFonts.roboto(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(
                '${DateFormat.yMMMMEEEEd().add_jm().format(temporary[position].endTime)}',
                style: GoogleFonts.roboto(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              (temporary[position].when != "ongoing")
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
                                Uri.encodeFull(temporary[position].name) +
                                '&location=' +
                                temporary[position].url)
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
                      onPressed: () => {launch(temporary[position].url)},
                    ),
            ],
          ),
        );
      },
    ),
  );
}
