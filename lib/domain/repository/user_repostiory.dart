import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
  Future<UserEntity> addUser(UserEntity user);
  Future<UserEntity> updateUser(UserEntity user);
}
