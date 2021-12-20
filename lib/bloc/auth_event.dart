part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  AuthModel authModel;
  SignInEvent({required this.authModel});
}
