import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:zigy_mobile_dev_task/home/domain/repository/user_repository.dart';
import 'package:zigy_mobile_dev_task/home/presentation/providers/state/user_list_state.dart';

import '../../../../failure.dart';
import '../../../domain/model/user_list_reponse_model.dart';

class UserListNotifier extends StateNotifier<UserListState> {
  final UserListRepository userListRepository;

  UserListNotifier(
    this.userListRepository,
  ) : super(UserListState.initial());

  bool get isFetching => state.isLoading;

  Future<void> getUsers() async {
    state = state.copyWith(isLoading: true);
    if (isFetching) {
      state = state.copyWith(isLoading: true);

      final response = await userListRepository.getUsers();

      updateStateFromResponse(response);
    }
  }

  void updateStateFromResponse(Either<List<User>, Failure> response) {
    response.fold((data) {
      state = state.copyWith(isLoading: false, users: data);
    }, (failure) {
      state = state.copyWith(
        isLoading: false,
        users: [],
        error: failure.message,
      );
    });
  }
}
