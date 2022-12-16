// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'switch_notification_bloc.dart';

abstract class SwitchNotificationEvent extends Equatable {}

class SwitchOffEvent extends SwitchNotificationEvent {
  int indexOfPrayTime;
  SwitchOffEvent({
    required this.indexOfPrayTime,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [indexOfPrayTime];
}

class SwitchOnEvent extends SwitchNotificationEvent {
  int indexOfPrayTime;
  SwitchOnEvent({
    required this.indexOfPrayTime,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [indexOfPrayTime];
}

class SwitchLoadEvent extends SwitchNotificationEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
