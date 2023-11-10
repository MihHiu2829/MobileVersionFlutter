import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:timeing/blocs/setting/settingEvent.dart';
import 'package:timeing/blocs/setting/settingState.dart';
import 'package:timeing/models/authentication.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc({required AuthenticationRes authenRes})
      : _authenRes = authenRes,
        super(SettingState()) {
    on<OnLogOut>(_onLogout);
  }

  final AuthenticationRes _authenRes;

  Future<void> _onLogout(OnLogOut event, Emitter<SettingState> emit) async {
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await Future<void>.delayed(
          Duration(milliseconds: Random().nextInt(4000) + 1000), () {
        _authenRes.logOut();
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      });
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
