import 'package:timeing/models/processLogin.dart';

abstract class LoginProcessEvent {}

class StatusChangedLoginProcess extends LoginProcessEvent {
  StatusChangedLoginProcess(this.status);  
  final ProcessLoginStatus status;
}
class StatusReturnLoginProcess extends LoginProcessEvent{}  


// class ProcessRegistering extends LoginProcessEvent {
//   ProcessRegistering(this.status);  
//   final ProcessLoginStatus status;
// }
// class ProcessLoginUser extends LoginProcessEvent {
//   ProcessForgotPassword(this.status);  
//   final ProcessLoginStatus status;
// }
// class ProcessForgotPassword extends LoginProcessEvent {
//   ProcessForgotPassword(this.status);  
//   final ProcessLoginStatus status;
// }



