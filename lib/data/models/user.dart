import 'package:equatable/equatable.dart';

class User extends Equatable {

  const User({required this.username, required this.password, required this.displayName});


  final String username;

  final String password;

  final String displayName;

  @override
  List<Object> get props => [username];

  static const empty = User(displayName: '-',password:'-' ,username: '-');
}
