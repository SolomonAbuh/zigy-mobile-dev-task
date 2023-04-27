import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zigy_mobile_dev_task/home/data/datasource/user_list_remote_datasource.dart';
import 'package:zigy_mobile_dev_task/home/data/repository/user_repository_impl.dart';
import 'package:zigy_mobile_dev_task/home/domain/repository/user_repository.dart';

final userListDataSource = Provider.family<UserListDataSource, Dio>((_, dio) {

  return UserListRemoteDataSource(dio);
});
final dioProvider = Provider<Dio>((ref) {
 
  return Dio();
});

final userListRepositoryProvider = Provider<UserListRepository>((ref) {
  final dioInstance = ref.read(dioProvider);
  final userListSource = ref.read(userListDataSource(dioInstance));

  return UserListRepositoryImpl(userListSource);
});
