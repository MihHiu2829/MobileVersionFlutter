// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeing/blocs/authentication/authenBloc.dart';
import 'package:timeing/blocs/authentication/authenState.dart';
import 'package:timeing/models/authentication.dart';
import 'package:timeing/page/counter%20page/counterPage.dart';
import 'package:timeing/page/LoginComponnent/loginPage.dart';
import '../other page/splashPage.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppView();
  }
}

class _AppView extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: _navigatorKey,
        builder: (context, child) {
          return BlocListener<AuthenticateBloc, AuthenticateState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.unknown:
                  break;
                case AuthenticationStatus.unauthenticated:
              
                  _navigator.pushAndRemoveUntil<void>(
                      LoginPage.route(), (route) => false);
                  // ForgotPassword.route(),
                  // (route) => false);
                  break;
                case AuthenticationStatus.authenticated:
                  //  Future<void>.delayed(Duration(seconds: 2), () {

                  // });
                  // _navigator.pushAndRemoveUntil<void>(
                  //     SplashPage.route(), (route) => false);
                  _navigator.pushAndRemoveUntil<void>(
                      CounterPage.route(), (route) => false);
                  break;
              }
            },
            child: child,
          );
        },
        onGenerateRoute:(settings) => SplashPage.route() ,
        );
  }


  @override
  void dispose() {
    super.dispose();
  }
}
