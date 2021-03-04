import 'dart:ffi';
import 'package:intl/intl.dart';

dynamic getUnixTime(dynamic time) {
  return (DateTime.fromMillisecondsSinceEpoch((time * 1000).toInt()));
}
