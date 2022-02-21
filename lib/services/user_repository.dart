import 'package:test_flutter_1/models/user//user.dart';
import 'package:test_flutter_1/services/user_api_provider.dart';

class UsersRepository {
  final UsersProvider _usersProvider = UsersProvider();
  Future<User> getUsers() => _usersProvider.getUser();
}
