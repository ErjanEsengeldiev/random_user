import 'package:dio/dio.dart';
import 'package:test_flutter_1/models/user.dart';

class UsersProvider {
  Future<User> getUser() async {
    const url = 'https://randomuser.me/api/';
    final response = await Dio().get(url);

    if (response.statusCode == 200) {
      final dynamic userJson = response.data;

      return User.fromJson(userJson);
    } else {
      throw Exception('Error fetching Users').toString();
    }
  }

  // Future<void> postUser(
  //     {required String name,
  //     required String email,
  //     required String username}) async {
  //   const url = 'https://jsonplaceholder.typicode.com/users';
  //   final response = await Dio().post(url,
  //       data: User(id: 12, name: name, username: username, email: email)
  //           .toJson());
  //   print(response);
  // }
}
