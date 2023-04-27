import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../data/models/models.dart';

class RegisterState extends Equatable {
  final FormzStatus status;
  final Username username;
  final Password password;
  final DisplayName displayName;

  RegisterState(
      {this.status = FormzStatus.pure,
      this.username = const Username.pure(),
      this.password = const Password.pure(),
      this.displayName = const DisplayName.pure()});

  RegisterState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
    DisplayName? displayName,
  }) {
    return RegisterState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      displayName: displayName ?? this.displayName,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, username, password, displayName];
}
