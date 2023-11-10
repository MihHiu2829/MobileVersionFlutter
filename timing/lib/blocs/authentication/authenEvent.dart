import 'package:timeing/models/authentication.dart';

abstract class AuthenticateEvent {}

class AuthenticateChangedLogin extends AuthenticateEvent {
  AuthenticateChangedLogin(this.status);
  final AuthenticationStatus status;
}

class AuthenticateChangedLogout extends AuthenticateEvent {}
