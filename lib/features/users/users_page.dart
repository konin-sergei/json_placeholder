import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/users_bloc.dart';
import 'bloc/users_event.dart';
import 'bloc/users_state.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: const UsersPageBody(),
      //bottomNavigationBar: Menu(),
    );
  }
}

class UsersPageBody extends StatelessWidget {
  const UsersPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //UsersBloc usersBloc = UsersBloc();

    return BlocProvider(
      create: (_) => UsersBloc()..add(UsersGetUsersEvent()),
      child: BlocBuilder<UsersBloc, UsersBaseState>(
        builder: (context, state) {
          if (state is UsersInProgressState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UsersFailureState) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is UsersGotState) {
            return ListView.separated(
              key: const ValueKey('listViewUsers'),
              padding: const EdgeInsets.all(8),
              itemCount: state.users.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    color: Colors.white10,
                    child: Center(
                      child: Text(
                        'Entry ${state.users[index].name}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
          // return const Text('Loading');
        },
      ),
    );
  }
}
