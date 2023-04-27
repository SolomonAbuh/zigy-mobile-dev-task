import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zigy_mobile_dev_task/home/presentation/providers/state/user_list_notifier.dart';
import 'package:zigy_mobile_dev_task/home/presentation/providers/state/user_list_state.dart';

import '../../domain/providers/user_list_provider.dart';

final userListNotifierProivder =
    StateNotifierProvider<UserListNotifier, UserListState>((ref) {
  final repository = ref.read(userListRepositoryProvider);

  return UserListNotifier(repository)..getUsers();
});
