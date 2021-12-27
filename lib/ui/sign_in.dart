import 'package:flutter/material.dart';
import 'package:flutter_course_winter_2021/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_winter_2021/models/auth_model.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<FormFieldState> fieldKey = GlobalKey();

  bool? submitCheck() {
    bool? state = formKey.currentState?.validate();
    return state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                autofocus: true,
                cursorColor: Colors.blue,
                keyboardAppearance: Brightness.dark,
                // maxLength: 3,
                // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                validator: (input) {
                  if (input != null) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(input);
                    emailValid =
                        true; //to run on bloc due to backend has default admin username
                    return emailValid ? null : 'check your email address';
                  } else
                    return 'enter email address';
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),

                  focusColor: Colors.indigo,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  // fillColor: Colors.red,
                  // filled: true,
                  enabled: true,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    borderSide: BorderSide(
                        color: Colors.indigo,
                        style: BorderStyle.solid,
                        width: 2),
                  ),
                  // suffixText: '@gmail.com',
                  contentPadding: EdgeInsets.all(4),
                  border: OutlineInputBorder(),
                  hintText: 'example@email.com',
                  labelText: 'email address',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: passwordController,
                validator: (input) {
                  if (input != null) {
                    bool passwordValid =
                        RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
                            .hasMatch(input);
                    passwordValid =
                        true; //to run on bloc due to backend has default admin password
                    return passwordValid ? null : 'weak password';
                  } else
                    return 'enter password';
                },
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  hintText: 'P@ssw0rd',
                  labelText: 'password',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SuccessedAuthState) {
                    Navigator.of(context).pushNamed('/home');
                  }
                },
                builder: (context, state) {
                  if (state is AuthInitial) {
                    return ElevatedButton(
                      onPressed: () {
                        if (submitCheck() ?? false) {
                          BlocProvider.of<AuthBloc>(context).add(
                            SignInEvent(
                              authModel: AuthModel(
                                  password: passwordController.text,
                                  username: emailController.text),
                            ),
                          );
                        }
                      },
                      child: Container(
                        child: Text('singin'),
                        alignment: Alignment.center,
                      ),
                    );
                  } else if (state is ProcessingAuthState) {
                    return CircularProgressIndicator();
                  } else if (state is FaildAuthState) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        if (submitCheck() ?? false) {
                          BlocProvider.of<AuthBloc>(context).add(
                            SignInEvent(
                              authModel: AuthModel(
                                  password: passwordController.text,
                                  username: emailController.text),
                            ),
                          );
                        }
                      },
                      child: Container(
                        child: Text('singin'),
                        alignment: Alignment.center,
                      ),
                    );
                  } else
                    return Text(
                      'something went wrong',
                      style: TextStyle(color: Colors.black),
                    );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
