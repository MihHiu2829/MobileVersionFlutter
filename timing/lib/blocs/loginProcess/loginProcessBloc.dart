import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:timeing/blocs/loginProcess/loginProcessEvent.dart';
import 'package:timeing/blocs/loginProcess/loginProcessState.dart';
import 'package:timeing/models/processLogin.dart';

class LoginProcessBloc extends Bloc<LoginProcessEvent, ProcessLoginState> {
  LoginProcessBloc({required ProcessLogin processLogin})
      : _processLogin = processLogin,
        super(const ProcessLoginState.login()) {
    on<StatusChangedLoginProcess>(_onStatusChangedLoginProcess);
    on<StatusReturnLoginProcess>(_onStatusReturnLoginProcess);
    _controller = _processLogin.status
        .listen((status) => add(StatusChangedLoginProcess(status)));
  }

  final ProcessLogin _processLogin;

  late StreamSubscription<ProcessLoginStatus> _controller;

  Future<void> close() {
    _controller.cancel();
    return super.close();
  }

  Future<void> _onStatusChangedLoginProcess(
      StatusChangedLoginProcess event, Emitter<ProcessLoginState> emit) async {
    switch (event.status) {
      case ProcessLoginStatus.login:
        emit(const ProcessLoginState.login());
      case ProcessLoginStatus.registering:
        emit(const ProcessLoginState.resgitering());
      case ProcessLoginStatus.renewPass:
        emit(const ProcessLoginState.renewPass());
      case ProcessLoginStatus.forgot:
        emit(const ProcessLoginState.forgotPassword());
    }
  }

  void _onStatusReturnLoginProcess(
      StatusReturnLoginProcess event, Emitter<ProcessLoginState> emit) {
    _processLogin.LogiProcess();
  }
}
