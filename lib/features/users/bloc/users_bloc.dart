import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:json_placeholder/models/user.dart';
import 'package:json_placeholder/repositories/users_repository.dart';
import 'users_event.dart';
import 'users_state.dart';

class UsersBloc extends Bloc<UsersBaseEvent, UsersBaseState> {
  UsersBloc() : super(UsersInitState()) {
    on<UsersGetUsersEvent>((event, emit) async {
      emit(UsersInProgressState());
      emit(await usersGet());
    });
  }

  Future<UsersBaseState> usersGet() async {
    UsersRepository usersRepository = UsersRepository();
    Either<ServerErrorUsers, List<User>> result = await usersRepository.fetchUsers();

    if (result.isRight) {
      List<User> users = result.right;
      return UsersGotState(users: users);
    } else {
      ServerErrorUsers serverError = result.left;
      String message = serverError.message;
      return UsersFailureState(message);
    }
  }
}
