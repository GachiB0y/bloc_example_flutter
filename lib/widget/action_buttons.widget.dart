import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:bloc_network_example/model/user_model.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:bloc_network_example/services/users_api_provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtonsWidget extends StatelessWidget {
  const ActionButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBLoc _userBLoc = BlocProvider.of<UserBLoc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            _userBLoc.add(UsersLoadEvent());
          },
          child: const Text('Load'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            _userBLoc.add(UsersClearEvent());
          },
          child: const Text('Clear'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        ),
      ],
    );
  }
}
