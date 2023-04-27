import 'package:fpdart/fpdart.dart';
import 'package:zigy_mobile_dev_task/failure.dart';
import 'package:zigy_mobile_dev_task/home/data/datasource/user_list_remote_datasource.dart';

import '../../domain/model/user_list_reponse_model.dart';
import '../../domain/repository/user_repository.dart';

class UserListRepositoryImpl extends UserListRepository {
  final UserListDataSource dataSource;
  UserListRepositoryImpl(this.dataSource);
  @override
  Future<Either<List<User>, Failure>> getUsers() {
    
    return dataSource.getUsers();
  }
}
