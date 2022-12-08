// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MonthTomes extends Equatable {
  Map<String, Map<String, dynamic>> timesPerMonth;
  MonthTomes({
    required this.timesPerMonth,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [timesPerMonth];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timesPerMonth': timesPerMonth,
    };
  }

  factory MonthTomes.fromMap(Map<String, dynamic> map) {
    return MonthTomes(
      timesPerMonth: Map<String, Map<String, dynamic>>.from(
          (map['timesPerMonth'] as Map<String, Map<String, dynamic>>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory MonthTomes.fromJson(String source) =>
      MonthTomes.fromMap(json.decode(source) as Map<String, dynamic>);
}
