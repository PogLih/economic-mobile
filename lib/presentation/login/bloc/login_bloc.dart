
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';

import '../../../data/models/models.dart';
import '../../../data/repository/authentication_repository/authentication_repository.dart';
import 'login_event.dart';
import '';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepositoryImpl = authenticationRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepositoryImpl;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        status: Formz.validate([state.password, username]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.username]),
      ),
    );
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    bool rs = false;
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
          rs = await _authenticationRepositoryImpl.logIn(
          username: state.username.value,
          password: state.password.value,
        );
        if (rs == true)
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (ex) {
        print(ex.toString());
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }

  @override
  Future<void> close()async {
    return super.close();
  }
}
