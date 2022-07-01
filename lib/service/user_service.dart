import 'package:sqlflite_demo/db_helper/repository.dart';
import 'package:sqlflite_demo/model/db_model.dart';

class UserService {
  late Repository _repository;
  UserService() {
    _repository = Repository();
  }

  saveUser(DbModel user) async {
    return await _repository.insertData("users", user.userMap());
  }

  readAllUser() async {
    return await _repository.readAllData('users');
  }

  updateUser(DbModel user) async {
    return await _repository.updateData('users', user.userMap());
  }

  deleteUser( userId) async{
     return await _repository.deleteUserById("users", userId);
  }
 

}
