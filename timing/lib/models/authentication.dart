import 'dart:async';
import 'dart:math';

import 'package:timeing/service/userService.dart';

enum AuthenticationStatus { unknown, unauthenticated, authenticated }

class AuthenticationRes {
  final _controller = StreamController<AuthenticationStatus>();
  late UseService useService;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<int> login({
    required String username,
    required String password,
  }) async {
    useService = UseService();
    final data =
        await useService.loginUser(username: username, password: password);
    await Future<void>.delayed(
        Duration(milliseconds: Random().nextInt(4000) + 1000),
        () => {
              if (data == 200)
                {_controller.add(AuthenticationStatus.authenticated)}
            });
    return data == 200 ? 1 : 0;
  }
    
  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
