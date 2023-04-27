import 'package:fpdart/fpdart.dart';
import 'package:zigy_mobile_dev_task/failure.dart';
import 'package:zigy_mobile_dev_task/home/domain/model/user_list_reponse_model.dart';


abstract class UserListRepository {
  Future<Either<List<User>,Failure>> getUsers();
}
