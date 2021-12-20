part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class ProcessingAuthState extends AuthState {}

class SuccessedAuthState extends AuthState {
  String token;
  SuccessedAuthState({required this.token});
}

class FaildAuthState extends AuthState {
  String? errorMessage = 'FAILD AUTH';
  FaildAuthState({this.errorMessage});
}
