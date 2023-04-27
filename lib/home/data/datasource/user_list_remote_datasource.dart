import 'package:dio/dio.dart';
import 'package:zigy_mobile_dev_task/home/domain/model/user_list_reponse_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../../failure.dart';

abstract class UserListDataSource {
  Future<Either<List<User>, Failure>> getUsers();
}

class UserListRemoteDataSource implements UserListDataSource {
  final Dio dio;
  UserListRemoteDataSource(this.dio);
  @override
  Future<Either<List<User>, Failure>> getUsers() async {
    try {
      List<User> temp = [];
      final response = await dio.get('https://reqres.in/api/users?page=2');
      final userList = List<Map<String, dynamic>>.from(response.data['data']);
      for (var element in userList) {
        temp.add(User.fromJson(element));
      }
      return left(temp);
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }
}
