import 'package:equatable/equatable.dart';

class User extends Equatable {
  static const empty = User('-', '-', '-', '-', '-', '-');
  final String userId ;   
  final String username;
  final String password;
  final String number;
  final String dateSignUp;
  final String name;
  const User( this.userId ,  
      this.username, this.password, this.name, this.number, this.dateSignUp);
  @override
  // TODO: implement props
  List<Object?> get props => [
        userId, 
        username,
        password,
        name,
        number,
        dateSignUp,
      ];
}
