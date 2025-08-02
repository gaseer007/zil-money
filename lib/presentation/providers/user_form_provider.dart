// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:zilmoney_machine_test/domain/models/user_model.dart';
//
// import '../../domain/repository/user_repostiory.dart';
//
// final userFormProvider =
//     StateNotifierProvider.autoDispose<UserFormNotifier, AsyncValue<UserModel?>>(
//       (ref) {
//         return UserFormNotifier(ref.watch(userRepositoryProvider));
//       },
//     );
//
// class UserFormNotifier extends StateNotifier<AsyncValue<UserModel?>> {
//   final UserRepository _repository;
//
//   UserFormNotifier(this._repository) : super(const AsyncValue.data(null));
//
//   Future<void> saveUser(UserModel user) async {
//     state = const AsyncValue.loading();
//     try {
//       final result =
//           user.id == null
//               ? await _repository.createUser(user)
//               : await _repository.updateUser(user);
//       state = AsyncValue.data(result);
//     } catch (e) {
//       state = AsyncValue.error(e, StackTrace.current);
//     }
//   }
// }
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/user_cases/add_user_usecase.dart';
import '../../domain/user_cases/update_user_usecase.dart';
import '../../injection/container.dart';

final userFormProvider =
    StateNotifierProvider<UserFormNotifier, AsyncValue<void>>(
      (ref) => UserFormNotifier(
        addUserUseCase: getIt<AddUserUseCase>(),
        updateUserUseCase: getIt<UpdateUserUseCase>(),
      ),
    );

class UserFormNotifier extends StateNotifier<AsyncValue<void>> {
  final AddUserUseCase addUserUseCase;
  final UpdateUserUseCase updateUserUseCase;

  UserFormNotifier({
    required this.addUserUseCase,
    required this.updateUserUseCase,
  }) : super(const AsyncValue.data(null));

  Future<void> submit(UserEntity user, {required bool isEdit}) async {
    state = const AsyncValue.loading();
    try {
      if (isEdit) {
        await updateUserUseCase(user);
      } else {
        await addUserUseCase(user);
      }
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
