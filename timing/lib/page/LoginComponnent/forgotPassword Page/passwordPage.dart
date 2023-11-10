import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeing/BackGround/backgroundLogin.dart';
import 'package:timeing/blocs/loginProcess/loginProcessBloc.dart';
import 'package:timeing/blocs/loginProcess/loginProcessEvent.dart';
import 'package:timeing/blocs/loginProcess/loginProcessState.dart';
import 'package:timeing/models/processLogin.dart';

import 'componnentForgotPassword.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static Route<void> route() {
    
    return MaterialPageRoute(
      builder: (context) => ForgotPasswordPage(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: sssimplement createState
    return _ForgotPassword();
  }
}

/*
Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 75, 12, 7),
          leading: InkWell(
            onTap: () {
              print('tap tap');
                
            },
            child: Icon(Icons.arrow_back_ios_new,
                size: 24, color: Color.fromARGB(255, 151, 112, 48)),
          ),
          title: const Text(
            'Login Counter App',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 151, 112, 48)),
          ),
        ),
        body: Stack(
          children: [
            const BG_login(),
            InforForgotPassword(),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputAccountToResetPassword(),
                  Container(
                    height: 15,
                  ),
                  InputNumberToResetPassword(),
                  OutputCheckToResetPassword(),
                ],
              ),
            )
          ],
        ));
        */
class _ForgotPassword extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<LoginProcessBloc, ProcessLoginState>(
        builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 75, 12, 7),
            leading: InkWell(
              onTap: () {
                context
                    .read<LoginProcessBloc>()
                    .add(StatusChangedLoginProcess(ProcessLoginStatus.login));
              },
              child: Icon(Icons.arrow_back_ios_new,
                  size: 24, color: Color.fromARGB(255, 151, 112, 48)),
            ),
            title: const Text(
              'Login Counter App',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 151, 112, 48)),
            ),
          ),
          body: Stack(
            children: [
              const BG_login(),
              InforForgotPassword(),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputAccountToResetPassword(),
                    Container(
                      height: 15,
                    ),
                    InputNumberToResetPassword(),
                    OutputCheckToResetPassword(),
                  ],
                ),
              )
            ],
          ));
    });
  }
}
