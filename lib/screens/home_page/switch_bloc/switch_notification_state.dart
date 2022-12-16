// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

part of 'switch_notification_bloc.dart';

abstract class SwitchNotificationState extends Equatable {
  // const SwitchNotificationState();

  // @override
  // List<Object> get props => [];
}

class SwitchLoadedState extends SwitchNotificationState {
  List<bool>? soundOnOff;
  SwitchLoadedState({
    required this.soundOnOff,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [soundOnOff];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'soundOnOff': soundOnOff,
    };
  }

  factory SwitchLoadedState.fromMap(Map<String, dynamic> map) {
    return SwitchLoadedState(
      soundOnOff: map['soundOnOff'] != null
          ? List<bool>.from((map['soundOnOff'] as List<bool>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SwitchLoadedState.fromJson(String source) =>
      SwitchLoadedState.fromMap(json.decode(source) as Map<String, dynamic>);
}

class SwitchLoadingState extends SwitchNotificationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// class SwitchNotificOnState extends SwitchNotificationState {
//   List<bool> soundOnOff;
//   SwitchNotificOnState({
//     required this.soundOnOff,
//   });
//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }
