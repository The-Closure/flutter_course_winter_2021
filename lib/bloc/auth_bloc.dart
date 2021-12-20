import 'package:bloc/bloc.dart';
import 'package:flutter_course_winter_2021/models/auth_model.dart';
import 'package:flutter_course_winter_2021/models/token_model.dart';
import 'package:flutter_course_winter_2021/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService = AuthService();
  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>((event, emit) async {
      emit(ProcessingAuthState());
      TokenModel tokenModel = await authService.signIn(event.authModel) ??
          TokenModel(idToken: 'EMPTY_TOKEN');
      if (tokenModel.idToken == 'EMPTY_TOKEN')
        emit(FaildAuthState());
      else
        emit(SuccessedAuthState(token: tokenModel.idToken));
    });
  }
}
