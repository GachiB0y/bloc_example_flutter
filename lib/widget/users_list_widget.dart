import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListWidget extends StatelessWidget {
  const UsersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBLoc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return const Center(
              child: Text('No data receivd.Pleas button "Load'));
        } else if (state is UserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoadedgState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[200],
              child: UserRowWodget(state: state, index: index),
            ),
          );
        } else if (state is UserErrorState) {
          return const Center(child: Text('Error loading users'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class UserRowWodget extends StatelessWidget {
  final UserLoadedgState? state;
  final int index;
  const UserRowWodget({Key? key, required this.state, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        'Id:${state?.loadedUser[index].id}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      title: Column(
        children: [
          Text(
            '${state?.loadedUser[index].name}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Email: ${state?.loadedUser[index].email}',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(
            'Phome: ${state?.loadedUser[index].phone}',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
