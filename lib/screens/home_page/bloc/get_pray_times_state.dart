// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'get_pray_times_bloc.dart';
// import 'dart:convert';

abstract class GetPrayTimesState extends Equatable {
  // const GetPrayTimesState();

  // @override
  // List<Object> get props => [];
}

class GetPrayTimesLoading extends GetPrayTimesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetPrayTimesLoaded extends GetPrayTimesState {
  final TodayPrayTimesModel tr;
  GetPrayTimesLoaded({
    required this.tr,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [tr];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tr': tr.toMap(),
    };
  }

  factory GetPrayTimesLoaded.fromMap(Map<String, dynamic> map) {
    return GetPrayTimesLoaded(
      tr: TodayPrayTimesModel.fromMap(map['tr'] as Map<String, dynamic>),
    );
  }

  // String toJson() => json.encode(toMap());

  // factory GetPrayTimesLoaded.fromJson(String source) =>
  //     GetPrayTimesLoaded.fromMap(json.decode(source) as Map<String, dynamic>);
}
