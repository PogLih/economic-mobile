import 'package:formz/formz.dart';

enum DisplayNameValidationError { empty }

class DisplayName extends FormzInput<String, DisplayNameValidationError> {
  const DisplayName.pure() : super.pure('');
  const DisplayName.dirty([super.value = '']) : super.dirty();

  @override
  DisplayNameValidationError? validator(String value) {
    if (value.isEmpty) return DisplayNameValidationError.empty;
    return null;
  }
}
