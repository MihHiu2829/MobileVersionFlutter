import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:timeing/blocs/login/loginEvent.dart';
import 'package:timeing/blocs/login/loginState.dart';
import 'package:timeing/models/authentication.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthenticationRes authenRes})
      : _authenRes = authenRes,
        super(const LoginState()) {
    on<OnUsernameEvent>(_onUsernameChanged);
    on<OnPasswordEvent>(_onPasswordChanged);
    on<OnSubbmited>(_onSubmitted);
    on<OnReset>(_onReset);
    // on<OnForgotButton>() ; 
    // on<OnSignUpButton>() ; 
  }
  final AuthenticationRes _authenRes;
  void _onUsernameChanged(OnUsernameEvent event, Emitter<LoginState> emit) {
    var username = event.username;
    print(username);
    emit(state.copytWith(
        username: username,
        isValid: (state.password == '' || username == '') ? false : true));
  }

  void _onReset(OnReset event, Emitter<LoginState> emit) {
    emit(state.copytWith(
        status: FormzSubmissionStatus.initial,
        isValid: false,
        username: '',
        password: ''));
  }

  void _onPasswordChanged(OnPasswordEvent event, Emitter<LoginState> emit) {
    var password = event.password;
    print(password);
    emit(state.copytWith(
        password: password,
        isValid: (password == '' || state.username == '') ? false : true));
  }

  Future<void> _onSubmitted(OnSubbmited event, Emitter<LoginState> emit) async {
    print(state.isValid);
    if (state.isValid) {
      // print('vao tien tring?');
      emit(state.copytWith(
        status: FormzSubmissionStatus.inProgress,
      ));
      // print('loading?');
      try {
        // print('user: ${state.username}, pass: ${state.password}');
        int value = await _authenRes.login(
            username: state.username, password: state.password);
        // print('loi');
        if (value == 1) {
          emit(state.copytWith(status: FormzSubmissionStatus.success));
        }
        if (value == 0) {
          emit(state.copytWith(
              status: FormzSubmissionStatus.failure, isValid: false));
        }
      } catch (_) {
        // print('vao trycatch ?');
        emit(state.copytWith(
            status: FormzSubmissionStatus.failure, isValid: false));
      }
    }
  }
}
