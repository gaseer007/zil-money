import '../entities/user_entity.dart';
import '../repository/user_repostiory.dart';

class AddUserUseCase {
  final UserRepository repository;
  AddUserUseCase({required this.repository});

  Future<UserEntity> call(UserEntity user) {
    return repository.addUser(user);
  }
}
