import 'package:equatable/equatable.dart';
import 'package:timeing/models/authentication.dart';


class AuthenticateState extends Equatable {
  const AuthenticateState._(
      {this.status = AuthenticationStatus.unknown});

  const AuthenticateState.unknown() : this._();
  const AuthenticateState.authenticated()
      : this._(status: AuthenticationStatus.authenticated);
  const AuthenticateState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  // TODO: implement props
  List<Object?> get props => [status];
  final AuthenticationStatus status;
}
