import 'package:test_flutter_1/models/user.dart';
import 'package:test_flutter_1/services/user_api_provider.dart';

class UsersRepository {
  final UsersProvider _usersProvider = UsersProvider();
  Future<User> getAllUsers() => _usersProvider.getUser();
}
