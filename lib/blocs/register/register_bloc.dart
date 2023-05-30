import 'package:bloc/bloc.dart';
import 'package:economic/blocs/register/register_event.dart';
import 'package:economic/data/repository/user_repository/user_repository.dart';
import 'package:economic/blocs/register/register_state.dart';
import 'package:formz/formz.dart';

import '../../data/models/models.dart';
import '../../data/models/user.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(RegisterState()) {
    on<RegisterUsernameChanged>(_onUsernameChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterDisplayNameChanged>(_onDisplayNameChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  final UserRepository _userRepository;

  void _onUsernameChanged(
    RegisterUsernameChanged event,
    Emitter<RegisterState> emit,
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
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.username]),
      ),
    );
  }

  void _onDisplayNameChanged(
    RegisterDisplayNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final displayName = DisplayName.dirty(event.displayName);
    emit(
      state.copyWith(
        displayName: displayName,
        status: Formz.validate([displayName]),
      ),
    );
  }

  Future<bool> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (!state.status.isInvalid) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        User? rs = await _userRepository.registerUser(
          username: state.username.value,
          password: state.password.value,
          displayname: state.displayName.value,
        );
        if (rs != User.empty) {
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        }else{
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
      } catch (ex) {
        print(ex.toString());
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
    return true;
  }
}
