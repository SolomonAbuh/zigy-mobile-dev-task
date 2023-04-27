// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/model/user_list_reponse_model.dart';

final userListStateProvider = Provider<UserListState>((ref) {
  return UserListState.initial();
});

enum UserListConcreteState { initial, loading, loaded }

class UserListState {
  final List<User> users;
  final bool isLoading;
  final String error;

  UserListState({
    required this.users,
    required this.isLoading,
    required this.error,
  });

  factory UserListState.initial() {
    return UserListState(
      users: [],
      isLoading: false,
      error: '',
    );
  }

  UserListState copyWith({
    List<User>? users,
    bool? isLoading,
    String? error,
  }) {
    return UserListState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
