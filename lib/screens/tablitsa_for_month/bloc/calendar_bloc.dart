import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../api/api_provider.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final ApiProvider _apiProvider = ApiProvider();

  CalendarBloc() : super(CalendarLoading()) {
    on<Load>((event, emit) async {
      emit(CalendarLoading());
      try {
        print('Started Profile Page Bloc');
        // final profilePage = await _profileRepository.getProfile(idofProfile);
        final timesPerMonth = await _apiProvider.getTimes(event.month);
        // print(profilePage);
        // print(profilePage.urlToAvatar);
        // print('Profile Page Bloc success');
        emit(CalendarLoaded(timesPerMonth: timesPerMonth));
      } catch (e) {
        print('Oshibka v bloce');
        print(e);
      }
    });
  }
}
