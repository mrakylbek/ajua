import 'dart:convert';

import 'package:ajua_namaz_1/models/today_pray_times_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../api/api_provider.dart';

part 'get_pray_times_event.dart';
part 'get_pray_times_state.dart';

class GetPrayTimesBloc extends Bloc<GetPrayTimesEvent, GetPrayTimesState> {
  final ApiProvider _apiProvider = ApiProvider();
  TodayPrayTimesModel tr = TodayPrayTimesModel(
      timesPerDay: {}, nextIndex: 6, drToNextTime: Duration(hours: 24));

  GetPrayTimesBloc() : super(GetPrayTimesLoading()) {
    on<GetPrayTimesEvent>((event, emit) async {
      // TODO: implement event handler
      emit(GetPrayTimesLoading());
      try {
        print('Started TodaysPrayTimes Bloc');
        // final profilePage = await _profileRepository.getProfile(idofProfile);
        tr = await _apiProvider.getTimesForToday();
        // print(profilePage);
        // print(profilePage.urlToAvatar);
        // print('Profile Page Bloc success');
        tr.timesPerDay.isNotEmpty ? emit(GetPrayTimesLoaded(tr: tr)) : null;
      } catch (e) {
        print('Oshibka v TodaysPrayTimes bloce');
        print(e);
      }
    });
  }
}
