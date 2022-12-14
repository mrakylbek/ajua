// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class TodayPrayTimesModel extends Equatable {
  Map<String, dynamic> timesPerDay;
  int nextIndex;
  Duration drToNextTime;
  String? fajrTime;
  TodayPrayTimesModel({
    required this.timesPerDay,
    required this.nextIndex,
    required this.drToNextTime,
    this.fajrTime,
  })
  // ;
  {
    this.fajrTime = this.fajrTime ?? '';
  }

  @override
  // TODO: implement props
  List<Object> get props => [timesPerDay, nextIndex, drToNextTime];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timesPerDay': timesPerDay,
      'nextIndex': nextIndex,
      'drToNextTime': drToNextTime,
    };
  }

  factory TodayPrayTimesModel.fromMap(Map<String, dynamic> map) {
    return TodayPrayTimesModel(
      timesPerDay: Map<String, dynamic>.from(
          (map['timesPerDay'] as Map<String, dynamic>)),
      nextIndex: map['nextIndex'] as int,
      drToNextTime: map['drToNextTime'] as Duration,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodayPrayTimesModel.fromJson(String source) =>
      TodayPrayTimesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
