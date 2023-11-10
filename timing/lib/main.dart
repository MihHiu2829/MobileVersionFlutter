import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeing/blocs/authentication/authenBloc.dart';
import 'package:timeing/models/authentication.dart';
import 'package:timeing/page/main%20Structer/appView.dart';
// import 'package:timeing/service/userService.dart';

void main() {
  // UseService useService = UseService();
  // useService.forgotPassword(username: 'Account007',  number: '0337254483');
  // callApiTest();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  late final AuthenticationRes _authenticationRes;

  @override
  void initState() {
    super.initState();
    _authenticationRes = AuthenticationRes();
  }


  @override
  void dispose() {
    super.dispose();
    _authenticationRes.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRes,
      child: BlocProvider(
          child: const AppView(),
          create: (_) =>
              AuthenticateBloc(authenticationRes: _authenticationRes)
              ),
    );
  }
}
