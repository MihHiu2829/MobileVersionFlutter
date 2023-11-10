import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:timeing/blocs/login/loginBloc.dart';
import 'package:timeing/blocs/login/loginEvent.dart';
import 'package:timeing/blocs/login/loginState.dart';
import 'package:timeing/models/authentication.dart';
import 'package:timeing/models/processLogin.dart';
import 'package:timeing/page/main%20Structer/appView.dart';

import '../../BackGround/backgroundLogin.dart';
import '../../blocs/loginProcess/loginProcessBloc.dart';
import '../../blocs/loginProcess/loginProcessState.dart';
import '../other page/splashPage.dart';
import 'componnent.dart';
import 'forgotPassword Page/passwordPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const LoginPage(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  late final ProcessLogin _processLoginValue;
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _processLoginValue = ProcessLogin();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _processLoginValue.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RepositoryProvider.value(
      value: _processLoginValue,
      child: BlocProvider(
          create: (context) =>
              LoginProcessBloc(processLogin: _processLoginValue),
          child: MaterialApp(
              navigatorKey: _navigatorKey,
              builder: (context, child) {
                return BlocListener<LoginProcessBloc, ProcessLoginState>(
                  listener: (context, state) {
                    switch (state.status) {
                      case ProcessLoginStatus.forgot:
                        // Navigator.of(context).push(ForgotPasswordPage.route());
                        _navigator.pushAndRemoveUntil(
                            ForgotPasswordPage.route(), (route) => false);
                        break;
                      case ProcessLoginStatus.renewPass:
                        break;
                      case ProcessLoginStatus.login:
                        _navigator.pushAndRemoveUntil<void>(
                            TotalLoginPage.route(), (route) => false);
                        break;
                      case ProcessLoginStatus.registering:
                        break;
                    }
                  },
                  child: child,
                );
              },
              onGenerateRoute: (_) => SplashPage.route())),
    );
  }
}

class TotalLoginPage extends StatefulWidget {
  //      static Route<void> route() {
  //   return MaterialPageRoute(
  //     builder: (context) => ForgotPasswordPage(),
  //   );
  // }

  static Route<void> route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => TotalLoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
    // return MaterialPageRoute(builder: (context) => TotalLoginPage());
  }

  @override
  State<StatefulWidget> createState() {
    return _TotalLoginPage();
  }
}

class _TotalLoginPage extends State<TotalLoginPage> {
  var cl1 = TextEditingController();
  var cl2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 89, 60, 58),
          title: const Text(
            'Login',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 151, 112, 48)),
          ),
        ),

        body: BlocProvider(
          create: ((context) {
            return LoginBloc(
                authenRes: RepositoryProvider.of<AuthenticationRes>(context));
          }),
          child: LoginForm(
            cl1: cl1,
            cl2: cl2,
          ),
        ));
  }
}

class LoginForm extends StatelessWidget {
  final _cl1 = TextEditingController();
  final _cl2 = TextEditingController();
  LoginForm(
      {required TextEditingController cl1, required TextEditingController cl2});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          print(state.status);
          if (state.status.isFailure) {
            _cl1.clear();
            _cl2.clear();
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Sai mat khau? '),
                  duration: Duration(milliseconds: 4500),
                ),
              );
            print('adduu ?');
            context.read<LoginBloc>().add(OnReset());
            print('duuu?');
          }
        },
        child: Stack(
          children: [
            const BG_login(),
            SafeArea(
              minimum: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                  ),
                  UsernameInput(controller: _cl1),
                  PasswordInput(
                    controller: _cl2,
                  ),
                  ButtonLogin(
                    controller1: _cl1,
                    controller2: _cl2,
                  ),
                  ForgotAndSignUp(),
                ],
              ),
            )
          ],
        ));
  }
}
