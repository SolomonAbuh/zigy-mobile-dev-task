import 'package:flutter/material.dart';
import 'package:zigy_mobile_dev_task/home/domain/model/user_list_reponse_model.dart';

class UserListTile extends StatelessWidget {
  final User user;
  const UserListTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar!),
      ),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.email!),
    );
  }
}
