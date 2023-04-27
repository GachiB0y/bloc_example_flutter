import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:bloc_network_example/model/user_model.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBLoc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBLoc({required this.userRepository}) : super(UserEmptyState()) {
    on<UsersLoadEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final List<User> loadedUserList = await userRepository.getAllUsers();
        print(loadedUserList);
        emit(UserLoadedgState(loadedUser: loadedUserList));
      } catch (e) {
        print(e);
        emit(UserErrorState());
      }
    });
    on<UsersClearEvent>((event, emit) async {
      emit(UserEmptyState());
    });
  }
}
