import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.username = '',
      this.password = '',
      this.isValid = false,
      this.status = FormzSubmissionStatus.initial});

  final String username;
  final String password;
  final FormzSubmissionStatus status;
  final bool isValid;

  LoginState copytWith(
      {FormzSubmissionStatus? status,
      String? username,
      String? password,
      bool? isValid}) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  LoginState resetFaiure() {
    return LoginState(
      status: FormzSubmissionStatus.success,
      username: this.username,
      password: this.password,  
      isValid: this.isValid,
    );
  }
  @override
  List<Object?> get props => [username, password, status];
}
