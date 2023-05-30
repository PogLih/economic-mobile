import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable{
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUsernameChanged extends RegisterEvent {
  const RegisterUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegisterDisplayNameChanged extends RegisterEvent {
  const RegisterDisplayNameChanged(this.displayName);

  final String displayName;

  @override
  List<Object> get props => [displayName];
}

class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}