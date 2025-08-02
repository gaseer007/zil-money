import 'package:dio/dio.dart';

import '../../domain/entities/user_entity.dart';
import '../../models/user.dart';

class UserRemoteDatasource {
  final Dio dio;
  UserRemoteDatasource({required this.dio});

  Future<List<UserModel>> fetchUsers() async {
    final response = await dio.get('/users');
    try {
      return (response.data as List)
          .map((json) => UserModel.fromJson(json))
          .toList();
    } catch (e, st) {
      print('Error parsing users: $e\n$st');
      return [];
    }
  }

  Future<UserModel> addUser(UserEntity user) async {
    final response = await dio.post('/users', data: user.toJson());
    return UserModel.fromJson(response.data);
  }

  Future<UserModel> updateUser(UserEntity user) async {
    final response = await dio.put('/users/${user.id}', data: user.toJson());
    return UserModel.fromJson(response.data);
  }
}
