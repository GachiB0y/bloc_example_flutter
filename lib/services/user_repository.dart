import 'package:bloc_network_example/model/user_model.dart';
import 'package:bloc_network_example/services/users_api_provider.dart';

class UserRepository {
  final UserApiProvider _userProvider = UserApiProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}
