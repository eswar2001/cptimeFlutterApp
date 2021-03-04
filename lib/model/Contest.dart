import 'package:cptime/microservice/timeGetter.dart';
import 'package:intl/intl.dart';

class Contest {
  final String name;
  final String url;
  final String platform;
  final DateTime startTime; //DateTime.parse("1969-07-20 20:18:04Z");
  final DateTime endTime; //DateTime.parse("1969-07-20 20:18:04Z");
  final String when;
  Contest(this.name, this.url, this.platform, this.startTime, this.endTime,
      this.when);

  Contest.fromJson(Map<String, dynamic> json, this.when)
      : name = json['name'],
        url = json['url'],
        platform = json['platform'],
        startTime = getUnixTime(json['startTime']),
        endTime = getUnixTime(json['endTime']);
}
