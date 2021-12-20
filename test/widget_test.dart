// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_course_winter_2021/bloc/auth_bloc.dart';
import 'package:flutter_course_winter_2021/models/auth_model.dart';
import 'package:flutter_course_winter_2021/models/post_model.dart';
import 'package:flutter_course_winter_2021/models/token_model.dart';
import 'package:flutter_course_winter_2021/services/auth_service.dart';
import 'package:flutter_course_winter_2021/services/posts_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_course_winter_2021/main.dart';

void main() {
  const token =
      'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTYzOTkzNTAyNH0.6XffARI2aVWBT1xtoxrqnCVNVI8TYD9LVryKRTzL929CDNP0DsZTtojUck0q75DCDzRPmthrH7-NVjuEveLNsA';
  test('VALID CRED', () async {
    AuthService authService = AuthService();
    TokenModel? token = await authService.signIn(
        AuthModel(password: 'admin', username: 'admin', rememberMe: true));
    if (token != null)
      print(token.idToken);
    else
      print('EMPTY_TOKEN');
  });
  test('description', () async {
    AuthBloc authBloc = AuthBloc();
    authBloc.add(SignInEvent(
        authModel: AuthModel(password: 'admin', username: 'admin')));
    int successed = await Future.delayed(Duration(seconds: 5), () => 0);
    String token = '';
    AuthState state = authBloc.state;
    if (state is SuccessedAuthState) {
      token = state.token;
    }
    print(state);
    print(token);
    PostService postService = PostService();
    List<PostModel> data = await postService.getAllPosts(token);
    data.forEach((element) => print(element.id));
  });

  test('auth bloc test', () async {
    AuthBloc authBloc = AuthBloc();
    print(authBloc.state);
    authBloc.add(SignInEvent(
        authModel: AuthModel(password: 'admin', username: 'admin')));
    int processing = await Future.delayed(Duration(milliseconds: 100), () => 0);
    print(authBloc.state);
    int successed = await Future.delayed(Duration(seconds: 5), () => 0);
    print(authBloc.state);
    authBloc.add(SignInEvent(
        authModel: AuthModel(password: 'adminn', username: 'admin')));
    processing = await Future.delayed(Duration(milliseconds: 100), () => 0);
    print(authBloc.state);
    int faild = await Future.delayed(Duration(seconds: 5), () => 0);
    print(authBloc.state);
  });
}
