import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_1/bloc/user_event.dart';
import 'package:test_flutter_1/bloc/user_satate.dart';
import 'package:test_flutter_1/models/user.dart';
import 'package:test_flutter_1/services/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc(this.usersRepository) : super(UserEmtyState()) {
    on<UserLoadEvent>(
      (event, emit) async {
        emit(UserLoadingState());
        try {
          final User loadedUser = await usersRepository.getAllUsers();
          emit(UserLoadedState(loadedUser: loadedUser));
        } catch (_) {
          emit(UserErorState());
        }
      },
    );
    on<UserCreateUserEvent>((event, emit) => emit(UserCreatingState()));

    on<UserClearEvent>((event, emit) => emit(UserEmtyState()));
  }
}
