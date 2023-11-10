// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:timeing/blocs/login/loginEvent.dart';
import 'package:timeing/blocs/login/loginState.dart';
import 'package:timeing/blocs/loginProcess/loginProcessBloc.dart';
import 'package:timeing/blocs/loginProcess/loginProcessState.dart';
import 'package:timeing/models/processLogin.dart';
import 'package:timeing/page/LoginComponnent/forgotPassword%20Page/passwordPage.dart';

import '../../blocs/login/loginBloc.dart';
import '../../blocs/loginProcess/loginProcessEvent.dart';

class UsernameInput extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  UsernameInput({required TextEditingController controller}) {
    _controller01 = controller;
  }
  late TextEditingController _controller01;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            cursorColor: Colors.black,
            controller: _controller01,
            onChanged: (username) => context
                .read<LoginBloc>()
                .add(OnUsernameEvent(username: username)),
            decoration: InputDecoration(
                prefixText: '  ',
                floatingLabelStyle: TextStyle(
                    color: Color.fromARGB(255, 151, 112, 48),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                alignLabelWithHint: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    gapPadding: 5.0,
                    borderSide: BorderSide(
                        width: 2.0, color: Color.fromARGB(255, 151, 112, 48))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    gapPadding: 5.0,
                    borderSide: BorderSide(
                        width: 2.0, color: Color.fromARGB(255, 151, 112, 48))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9), gapPadding: 6.0),
                labelText: 'username',
                labelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                )),
          ),
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  PasswordInput({required TextEditingController controller}) {
    _controller02 = controller;
  }
  late TextEditingController _controller02;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            cursorColor: Colors.black,
            controller: _controller02,
            onChanged: (password) => context
                .read<LoginBloc>()
                .add(OnPasswordEvent(password: password)),
            decoration: InputDecoration(
                prefixText: '  ',
                floatingLabelStyle: TextStyle(
                    color: Color.fromARGB(255, 151, 112, 48),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                alignLabelWithHint: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    gapPadding: 5.0,
                    borderSide: BorderSide(
                        width: 2.0, color: Color.fromARGB(255, 151, 112, 48))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    gapPadding: 5.0,
                    borderSide: BorderSide(
                        width: 2.0, color: Color.fromARGB(255, 151, 112, 48))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9), gapPadding: 6.0),
                labelText: 'password',
                labelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                )),
          ),
        );
      },
    );
  }
}

class ButtonLogin extends StatelessWidget {
  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();
  ButtonLogin(
      {required TextEditingController controller1,
      required TextEditingController controller2}) {
    _controller1 = controller1;
    _controller2 = controller2;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state.status.isInProgress) {
          return Container(
              padding: EdgeInsets.all(20),
              child: Center(
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 151, 112, 48),
                      ))));
        }

        return Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: SizedBox(
            width: 120,
            height: 35,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromARGB(255, 75, 12, 7)),
                  foregroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 135, 89, 85)),
                ),
                onPressed: state.isValid
                    ? () {
                        context.read<LoginBloc>().add(
                              OnSubbmited(cl1: _controller1, cl2: _controller2),
                            );
                        print(_controller1.value.text);
                        print(_controller2.value.text);
                        // Future.delayed(Duration(seconds: 1), () {
                        //   _controller1.clear();
                        //   _controller2.clear();
                        // });
                      }
                    : null,
                child: const Text(
                  'login',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 151, 112, 48)),
                )),
          ),
        );
      },
    );
  }
}

class ForgotAndSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<LoginProcessBloc, ProcessLoginState>(
      builder: (context, state) {
        return Expanded(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        // Navigator.of(context).push(ForgotPasswordPage.route());
                        Future<void>.delayed(Duration(milliseconds: 875), () {
                          context.read<LoginProcessBloc>().add(
                              StatusChangedLoginProcess(
                                  ProcessLoginStatus.forgot));
                        });
                        // Center(
                        //   child: CircularProgressIndicator(),
                        // ) ;  
                      },
                      child: Text(
                        'forgot password?',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 151, 112, 48)),
                      ),
                    ),
                    Text(
                      '?',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 151, 112, 48)),
                    ),
                    MaterialButton(
                        onPressed: () {},
                        child: const Text(
                          'SignUp',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 151, 112, 48)),
                        )),
                  ],
                )));
      },
    );
  }
}
