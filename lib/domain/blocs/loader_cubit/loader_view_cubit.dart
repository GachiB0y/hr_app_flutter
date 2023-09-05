import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/repository/auth_repository.dart';

enum LoaderViewCubitState { authorized, notAuthorized, unknown }

class LoaderViewCubit extends Cubit<LoaderViewCubitState> {
  final AuthRepository authRepository;

  LoaderViewCubit({required this.authRepository})
      : super(LoaderViewCubitState.unknown) {
    asyncInit();
  }

  Future<void> asyncInit() async {
    await checkAuth();
  }

  Future<void> checkAuth() async {
    final isAuth = await authRepository.isAuth();
    isAuth
        ? emit(LoaderViewCubitState.authorized)
        : emit(LoaderViewCubitState.notAuthorized);
  }

  Future<void> logout() async {
    await authRepository.logout();
  }
}
