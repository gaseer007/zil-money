import '../entities/user_entity.dart';
import '../repository/user_repostiory.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase({required this.repository});

  Future<List<UserEntity>> call() => repository.getUsers();
}
