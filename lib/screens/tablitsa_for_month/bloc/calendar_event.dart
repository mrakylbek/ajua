// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

part of 'calendar_bloc.dart';

@immutable
abstract class CalendarEvent extends Equatable {}

class Load extends CalendarEvent {
  final int month;
  Load({
    required this.month,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'month': month,
    };
  }

  factory Load.fromMap(Map<String, dynamic> map) {
    return Load(
      month: map['month'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Load.fromJson(String source) =>
      Load.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
