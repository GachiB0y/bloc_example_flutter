import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:bloc_network_example/widget/action_buttons.widget.dart';
import 'package:bloc_network_example/widget/users_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageWidget extends StatelessWidget {
  HomePageWidget({super.key});
  final userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBLoc(userRepository: userRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Uset List'),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ActionButtonsWidget(),
            SizedBox(
              height: 20,
            ),
            Expanded(child: UsersListWidget()),
          ],
        ),
      ),
    );
  }
}
