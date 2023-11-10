import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnInputAccount extends ForgotPasswordEvent {
  OnInputAccount({required this.username});
  final String username;
  @override
  // TODO: implement props
  List<Object?> get props => [username];
}

class OnInputNumber extends ForgotPasswordEvent {
  OnInputNumber({required this.number});
  final String number;
  @override
  // TODO: implement props
  List<Object?> get props => [number];
}

class OnCheckAccountExist extends ForgotPasswordEvent {
  OnCheckAccountExist();   
}
