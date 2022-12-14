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
    on<CalendarLoadEvent>((event, emit) async {
      emit(CalendarLoading());
      try {
        print('Started Calendar Bloc');
        // final profilePage = await _profileRepository.getProfile(idofProfile);
        final timesPerMonth =
            await _apiProvider.getTimesForTablitsa(event.month, event.year);
        // print(profilePage);
        // print(profilePage.urlToAvatar);
        // print('Profile Page Bloc success');
        timesPerMonth.isNotEmpty
            ? emit(CalendarLoaded(timesPerDayInMonth: timesPerMonth))
            : null;
      } catch (e) {
        print('Oshibka v Calendar bloce');
        print(e);
      }
    });
  }
}
