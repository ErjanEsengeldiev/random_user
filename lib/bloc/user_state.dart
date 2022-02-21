import 'package:test_flutter_1/models/user//user.dart';

abstract class UserState {}

class UserEmtyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  User loadedUser;

  UserLoadedState({required this.loadedUser});
}

class UserErorState extends UserState {}
