// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

part of 'calendar_bloc.dart';

@immutable
abstract class CalendarState extends Equatable {}

// class CalendarInitial extends CalendarState {}

class CalendarLoaded extends CalendarState {
  final Map<int, Map<String, dynamic>> timesPerDayInMonth;
  CalendarLoaded({
    required this.timesPerDayInMonth,
  });
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timesPerMonth': timesPerDayInMonth,
    };
  }

  factory CalendarLoaded.fromMap(Map<String, dynamic> map) {
    return CalendarLoaded(
      timesPerDayInMonth: Map<int, Map<String, dynamic>>.from(
          (map['timesPerMonth'] as Map<int, Map<String, dynamic>>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CalendarLoaded.fromJson(String source) =>
      CalendarLoaded.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CalendarLoading extends CalendarState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
