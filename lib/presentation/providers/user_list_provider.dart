import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/user_cases/user_usecases.dart';
import '../../injection/container.dart';

final userListProvider =
    AsyncNotifierProvider<UserListNotifier, List<UserEntity>>(() {
      return UserListNotifier(getUsersUseCase: getIt.get<GetUsersUseCase>());
    });

class UserListNotifier extends AsyncNotifier<List<UserEntity>> {
  final GetUsersUseCase getUsersUseCase;

  UserListNotifier({required this.getUsersUseCase});

  @override
  Future<List<UserEntity>> build() async {
    return await getUsersUseCase();
  }
}
