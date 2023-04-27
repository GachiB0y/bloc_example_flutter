import 'package:bloc_network_example/model/user_model.dart';

abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedgState extends UserState {
  List<User> loadedUser;

  UserLoadedgState({required this.loadedUser});
}

class UserErrorState extends UserState {}
