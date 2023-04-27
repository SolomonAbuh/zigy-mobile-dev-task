import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zigy_mobile_dev_task/home/presentation/providers/user_list_state_provider.dart';
import 'package:zigy_mobile_dev_task/home/presentation/views/widgets/user_list_tile.dart';

class UserListPage extends ConsumerStatefulWidget {
  const UserListPage({super.key});

  @override
  ConsumerState<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends ConsumerState<UserListPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userListNotifierProivder);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : state.error.isNotEmpty
              ? Center(
                  child: Text(state.error),
                )
              : ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final user = state.users[index];
                    return UserListTile(user: user);
                  },
                ),
    );
  }
}
