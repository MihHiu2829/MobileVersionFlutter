import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:http/http.dart';
import 'package:timeing/blocs/forgotPassword/forgotPasswordEvent.dart';
import 'package:timeing/blocs/forgotPassword/forgotPasswordState.dart';
import 'package:timeing/models/processLogin.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({required ProcessLogin processLogin})
      : _processLogin = processLogin,
        super(const ForgotPasswordState()) {
    on<OnInputAccount>(_onInputAccount);
    on<OnInputNumber>(_onInputNumber);
    on<OnCheckAccountExist>(_onCheckAccountIsExist);
  }

  final ProcessLogin _processLogin;

  void _onInputAccount(
      OnInputAccount event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(
        account: event.username,
        isValid: (state.account == '' || state.number == '') ? false : true));
  }

  void _onInputNumber(OnInputNumber event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(
        account: event.number,
        isValid: (state.account == '' || state.number == '') ? false : true));
  }

  Future<void> _onCheckAccountIsExist(
      OnCheckAccountExist event, Emitter<ForgotPasswordState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      try {
        Response response = await _processLogin.ForgotPasswordAccount(
            account: state.account, number: state.number);
        if (response.statusCode == 404) {
          var mess = response.body as Map;
          String message = mess['message'] as String;
          emit(state.copyWith(
              mess: message, status: FormzSubmissionStatus.canceled));
        }
        if (response.statusCode == 200) {
          emit(state.copyWith(status: FormzSubmissionStatus.success));  
        }
      } catch (_) {
        emit(state.copyWith(
            status: FormzSubmissionStatus.failure, isValid: false));
      }
    }
  }
}
