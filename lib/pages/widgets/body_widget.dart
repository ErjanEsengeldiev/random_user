import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_1/bloc/user_bloc.dart';
import 'package:test_flutter_1/bloc/user_event.dart';
import 'package:test_flutter_1/models/user.dart';
import 'package:test_flutter_1/pages/widgets/femail_widget.dart';
import 'package:test_flutter_1/pages/widgets/two_buttons_widget.dart';

class Body extends StatelessWidget {
  final User user;
  const Body({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                bottom: 1,
                top: 1,
                left: 1,
                right: 1,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [BoxShadow(blurRadius: 20)],
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      user.results!.first.picture!.large.toString()),
                  radius: 80,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '${user.results!.first.name!.first} ${user.results!.first.name!.last}',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 20),
          const TwoButtonsWidget(),
          const SizedBox(height: 20),
          FemailButtonsWidget(
            gender: user.results!.first.gender.toString(),
          ),
          const SizedBox(height: 50),
          BlocProvider.value(
            value: context.read<UserBloc>(),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 80))),
              onPressed: () {
                context.read<UserBloc>().add(UserLoadEvent());
              },
              child: const Icon(Icons.replay_outlined),
            ),
          )
        ],
      ),
    );
  }
}
