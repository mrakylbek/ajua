import 'dart:convert';

import 'package:ajua_namaz_1/constants/data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_notification_event.dart';
part 'switch_notification_state.dart';

class SwitchNotificationBloc
    extends Bloc<SwitchNotificationEvent, SwitchNotificationState> {
  List<bool> sounds = soundOnOff;

  SwitchNotificationBloc() : super(SwitchLoadingState()) {
    on<SwitchOffEvent>((event, emit) {
      print('SwitchOffEvent');

      // TODO: implement event handler
      emit(SwitchLoadingState());
      try {
        print(sounds);
        sounds[event.indexOfPrayTime] = false;
        print('SOUND WITH INDEX ' +
            event.indexOfPrayTime.toString() +
            ' CHANGED TO ' +
            sounds[event.indexOfPrayTime].toString());
        print(sounds);
        emit(SwitchLoadedState(soundOnOff: sounds));
      } catch (e) {
        print('ERROR IN SWITCH OFF EVENT');
      }
    });
    on<SwitchOnEvent>((event, emit) {
      print('SwitchOnEvent');
      // TODO: implement event handler
      emit(SwitchLoadingState());
      try {
        // print(event.indexOfPrayTime);
        print(sounds);
        sounds[event.indexOfPrayTime] = true;
        print('SOUND WITH INDEX ' +
            event.indexOfPrayTime.toString() +
            ' CHANGED TO ' +
            sounds[event.indexOfPrayTime].toString());
        print(sounds);
        emit(SwitchLoadedState(soundOnOff: sounds));
      } catch (e) {
        print('ERROR IN SWITCH OFF EVENT');
      }
    });
    on<SwitchLoadEvent>((event, emit) {
      print('SwitchOnEvent');
      // TODO: implement event handler
      emit(SwitchLoadingState());
      try {
        // print(event.indexOfPrayTime);
        // print(sounds);
        // sounds[event.indexOfPrayTime] = true;
        // print(sounds);
        emit(SwitchLoadedState(soundOnOff: sounds));
      } catch (e) {
        print('ERROR IN SWITCH OFF EVENT');
      }
    });
  }
}
