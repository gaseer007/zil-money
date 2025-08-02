import 'package:dio/dio.dart';

import '../../../domain/entities/user_entity.dart';
import '../../domain/repository/user_repostiory.dart';
import '../data_source/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource remoteDatasource;

  UserRepositoryImpl({required this.remoteDatasource});
  final Dio dio = Dio();

  @override
  Future<List<UserEntity>> getUsers() {
    return remoteDatasource.fetchUsers();
  }

  @override
  Future<UserEntity> addUser(UserEntity user) {
    return remoteDatasource.addUser(user);
  }

  @override
  Future<UserEntity> updateUser(UserEntity user) {
    return remoteDatasource.updateUser(user);
  }
}
