import '../entities/user_entity.dart';
import '../repository/user_repostiory.dart';

class UpdateUserUseCase {
  final UserRepository repository;
  UpdateUserUseCase({required this.repository});

  Future<UserEntity> call(UserEntity user) {
    return repository.updateUser(user);
  }
}
