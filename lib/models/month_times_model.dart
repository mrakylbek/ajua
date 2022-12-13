// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class MonthTimes extends Equatable {
//   Map<String, Map<String, dynamic>> timesPerMonth;
//   MonthTimes({
//     required this.timesPerMonth,
//   });

//   @override
//   // TODO: implement props
//   List<Object?> get props => [timesPerMonth];

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'timesPerMonth': timesPerMonth,
//     };
//   }

//   factory MonthTimes.fromMap(Map<String, dynamic> map) {
//     return MonthTimes(
//       timesPerMonth: Map<String, Map<String, dynamic>>.from(
//           (map['timesPerMonth'] as Map<String, Map<String, dynamic>>)),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory MonthTimes.fromJson(String source) =>
//       MonthTimes.fromMap(json.decode(source) as Map<String, dynamic>);
// }
