import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.mess = ''  ,  
    this.account = '',
    this.number = '',
    this.status = FormzSubmissionStatus.inProgress,
    this.isValid = false,
  });
  final String mess;  
  final String account; // username!
  final String number;
  final FormzSubmissionStatus status;
  final bool isValid;

  @override
  List<Object?> get props => [account, number, status, mess ];

  ForgotPasswordState copyWith(
      {FormzSubmissionStatus? status,
      String? mess ,  
      String? account,
      String? number,
      bool? isValid}) {
    return ForgotPasswordState(
        status: status ?? this.status,
        mess: mess  ?? this.mess,
        number: number ?? this.number,
        isValid: isValid ?? this.isValid,
        account: account ?? this.account);
  }

  ForgotPasswordState resetProcess() {
    return ForgotPasswordState(
        mess: mess  ?? this.mess,
        status: FormzSubmissionStatus.success,
        account: this.account,
        isValid: false,
        number: this.number);
  }
  
}
