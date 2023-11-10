import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:timeing/blocs/counter/counterBloc.dart';
import 'package:timeing/blocs/counter/counterEvent.dart';
import 'package:timeing/blocs/counter/counterState.dart';
import 'package:timeing/blocs/login/loginEvent.dart';
import 'package:timeing/blocs/setting/settingBloc.dart';
import 'package:timeing/blocs/setting/settingEvent.dart';
import 'package:timeing/blocs/setting/settingState.dart';

import '../../BackGround/backgroundLogin.dart';
import '../../blocs/counter/ticker.dart';
import '../../models/authentication.dart';

class ShowTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final duration = context.select((CounterBloc bloc) => bloc.state.duration);
    final seconds = ((duration % 60)).floor().toString().padLeft(2, '0');
    final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    // TODO: implement build
    return Text(
      '$minutes:$seconds',
      style: TextStyle(
          fontSize: 68,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 151, 112, 48)),
    );
  }
}

class CounterPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (context) => CounterPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterBloc(tick: Tick()),
        child: Scaffold(
            drawer: Drawer(
                shadowColor: Color.fromARGB(255, 75, 12, 7),
                backgroundColor: Color.fromARGB(255, 112, 16, 10),
                child: BlocProvider(
                    create: (_) => SettingBloc(
                        authenRes:
                            RepositoryProvider.of<AuthenticationRes>(context)),
                    child: ListView(
                      children: [
                        const ListTile(
                          leading: Icon(
                            Icons.settings,
                            size: 30,
                            color: Color.fromARGB(255, 151, 112, 48),
                          ),
                          title: Text(
                            'Setting',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 151, 112, 48)),
                          ),
                        ),
                        BlocBuilder<SettingBloc, SettingState>(
                          builder: (context, state) {
                            return ListTile(
                              leading: Text(
                                '-',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 151, 112, 48)),
                              ),
                              title: Text(
                                'Show Myprofile',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 151, 112, 48)),
                              ),
                              onTap: () {},
                            );
                          },
                        ),
                        ListTile(
                          leading: Text(
                            '-',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 151, 112, 48)),
                          ),
                          title: Text(
                            'Show current result',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 151, 112, 48)),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Text(
                            '-',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 151, 112, 48)),
                          ),
                          title: Text(
                            'Customize time',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 151, 112, 48)),
                          ),
                          onTap: () {},
                        ),
                        BlocBuilder<SettingBloc, SettingState>(
                          builder: (context, state) {
                            BuildContext contextSettimgBloc = context;
                            return ListTile(
                                leading: const Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 151, 112, 48)),
                                ),
                                title: const Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 151, 112, 48)),
                                ),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancel')),
                                          TextButton(
                                              onPressed: () {
                                                contextSettimgBloc
                                                    .read<SettingBloc>()
                                                    .add(OnLogOut());
                                                Navigator.of(context).pop();
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Color.fromARGB(
                                                            255, 151, 112, 48),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: const Text('Logout')),
                                        ],
                                        title: const Text('Logout'),
                                        content: const Text(
                                            'Still logout this account?'),
                                      );
                                    },
                                  );
                                });
                          },
                        )
                      ],
                    ))),
            appBar: AppBar(
              iconTheme:
                  IconThemeData(color: Color.fromARGB(255, 151, 112, 48)),
              backgroundColor: Color.fromARGB(255, 75, 12, 7),
              title: const Text(
                'countdown ?',
                style: TextStyle(
                    color: Color.fromARGB(255, 151, 112, 48),
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ),
            body: Stack(
              children: <Widget>[
                BG_counter(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShowTime(),
                    Container(
                        margin: const EdgeInsets.all(20),
                        child: BlocBuilder<CounterBloc, CounterState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                if (state is TimeStartProgress) ...[
                                  ElevatedButton(
                                      onPressed: () {
                                        context.read<CounterBloc>().add(
                                            TimeStartEvent(
                                                duration: state.duration));
                                      },
                                      child: Icon(
                                        Icons.play_arrow,
                                        size: 44,
                                        color: Color.fromARGB(255, 174, 147, 8),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(10),
                                        backgroundColor: const Color.fromARGB(
                                            255, 85, 16, 16),
                                      )),
                                ],
                                if (state is TimeInProgress) ...[
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<CounterBloc>()
                                            .add(TimePauseEvent());
                                      },
                                      child: Icon(
                                        Icons.pause,
                                        size: 44,
                                        color: Color.fromARGB(255, 174, 147, 8),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(10),
                                        backgroundColor: const Color.fromARGB(
                                            255, 85, 16, 16),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<CounterBloc>()
                                            .add(TimeResetEvent());
                                      },
                                      child: Icon(
                                        Icons.replay,
                                        size: 44,
                                        color: Color.fromARGB(255, 174, 147, 8),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(10),
                                        backgroundColor: const Color.fromARGB(
                                            255, 85, 16, 16),
                                      )),
                                ],
                                if (state is TimeCompleteProgress) ...[
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<CounterBloc>()
                                            .add(TimeResetEvent());
                                      },
                                      child: Icon(
                                        Icons.restore_page,
                                        size: 44,
                                        color: Color.fromARGB(255, 174, 147, 8),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(10),
                                        backgroundColor: const Color.fromARGB(
                                            255, 85, 16, 16),
                                      )),
                                ],
                                if (state is TimePauseProgress) ...[
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<CounterBloc>()
                                            .add(TimeResumeEvent());
                                      },
                                      child: Icon(
                                        Icons.play_arrow,
                                        size: 44,
                                        color: Color.fromARGB(255, 174, 147, 8),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(10),
                                        backgroundColor: const Color.fromARGB(
                                            255, 85, 16, 16),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<CounterBloc>()
                                            .add(TimeResetEvent());
                                      },
                                      child: Icon(
                                        Icons.replay,
                                        size: 44,
                                        color: Color.fromARGB(255, 174, 147, 8),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(10),
                                        backgroundColor: const Color.fromARGB(
                                            255, 85, 16, 16),
                                      )),
                                ],
                              ],
                            );
                          },
                        )),
                  ],
                ),
              ],
            )));
  }
}
/**
 *
 */
