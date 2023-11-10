import 'package:equatable/equatable.dart';
import 'package:timeing/models/processLogin.dart';

class ProcessLoginState extends Equatable {
  const ProcessLoginState._({this.status = ProcessLoginStatus.login});
  const ProcessLoginState.login() : this._();
  const ProcessLoginState.resgitering()
      : this._(status: ProcessLoginStatus.registering );
  const ProcessLoginState.forgotPassword()
      : this._(status: ProcessLoginStatus.forgot);
  const ProcessLoginState.renewPass()
      : this._(status: ProcessLoginStatus.renewPass);

  @override
  // TODO: implement props
  List<Object?> get props => [status];
  final ProcessLoginStatus status;
}
