// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

part of 'calendar_bloc.dart';

@immutable
abstract class CalendarEvent extends Equatable {}

class CalendarLoadEvent extends CalendarEvent {
  final int month;
  final int year;
  CalendarLoadEvent({
    required this.month,
    required this.year,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
