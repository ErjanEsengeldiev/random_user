import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_1/bloc/user_bloc.dart';
import 'package:test_flutter_1/bloc/user_event.dart';
import 'package:test_flutter_1/bloc/user_state.dart';
import 'package:test_flutter_1/pages/widgets/body_widget.dart';
import 'package:test_flutter_1/services/user_repository.dart';

class HomePage extends StatelessWidget {
  final UsersRepository repository = UsersRepository();
  final usersRepository = UsersRepository();

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = UserBloc(repository);

    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(usersRepository),
      child: Scaffold(
        backgroundColor: Colors.white12,
        body: BlocProvider<UserBloc>(
          create: (context) => UserBloc(repository),
          child: BlocBuilder<UserBloc, UserState>(
              bloc: userBloc,
              builder: (context, state) {
                if (state is UserEmtyState) {
                  return Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Для старта нажмите кнопку',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                              minimumSize: MaterialStateProperty.all(
                                  Size(MediaQuery.of(context).size.width, 80))),
                          onPressed: () {
                            userBloc.add(UserLoadEvent());
                          },
                          child: const Icon(Icons.replay_outlined),
                        ),
                      ],
                    ),
                  );
                } else if (state is UserLoadedState) {
                  return BlocProvider.value(
                    value: userBloc,
                    child: Body(
                      user: state.loadedUser,
                    ),
                  );
                } else if (state is UserErorState) {
                  return const Center(
                      child: Text(
                    'ErorFetchingUsers',
                    style: TextStyle(color: Colors.white),
                  ));
                } else if (state is UserLoadingState) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                } else {
                  return const Center(
                    child: Text('IncorectState'),
                  );
                }
              }),
        ),
      ),
    );
  }
}
