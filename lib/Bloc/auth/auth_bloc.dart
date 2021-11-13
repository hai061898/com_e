// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:e_com/Repositories/auth_repositories.dart';

import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState());

  Stream<AuthState> mapEventoState(AuthEvent event) async* {
    if (event is RegisterEvent) {
      yield* _mapAuthenticationRegister(event.username.toString(),
          event.email.toString(), event.password.toString());
    } else if (event is LoginEvent) {
      yield* _mapAuthenticationLogin(
          event.email.toString(), event.password.toString());
    } else if (event is CheckLoginEvent) {
      yield* _mapCheckAuthentication();
    } else if (event is LogOutEvent) {
      yield* _mapLogOutLogin();
    } else if (event is ChangePictureProfile) {
      yield* _mapChangeFotoProfile(event.image.toString());
    }
  }

  Stream<AuthState> _mapAuthenticationRegister(
      String user, String email, String password) async* {
    try {
      yield LoadingRegisterState();

      await Future.delayed(const Duration(seconds: 1));

      final data = await authRepositories.createUsers(
          user: user, email: email, password: password);

      if (data.resp) {
        yield RegisterSuccess();
      } else {
        yield FailureRegisterState(error: data.msj);
      }
    } catch (e) {
      yield FailureRegisterState(error: e.toString());
    }
  }

  Stream<AuthState> _mapAuthenticationLogin(
      String email, String password) async* {
    final secureStorage = FlutterSecureStorage();

    final hasToken = await authRepositories.hasToken();

    if (hasToken) {
      final data = await authRepositories.renewToken();

      await Future.delayed(Duration(seconds: 1));

      if (data.resp) {
        yield LogInState();

        yield state.copyWith(
            uid: data.users.id.toString(),
            username: data.users.users,
            email: data.users.email,
            profile: data
                .users.profile); // thực hiện sao chép state của trường dữ liệu

      } else {
        yield LogOutState();
        await secureStorage.deleteAll();
      }
    } else {
      yield LogOutState();
      await secureStorage.deleteAll();
    }
  }

  Stream<AuthState> _mapCheckAuthentication() async* {
    final secureStorage = FlutterSecureStorage();

    final hasToken = await authRepositories.hasToken();

    if (hasToken) {
      final data = await authRepositories.renewToken();

      await Future.delayed(Duration(seconds: 1));

      if (data.resp) {
        yield LogInState();

        yield state.copyWith(
            uid: data.users.id.toString(),
            username: data.users.users,
            email: data.users.email,
            profile: data.users.profile);
      } else {
        yield LogOutState();
        await secureStorage.deleteAll();
      }
    } else {
      yield LogOutState();
      await secureStorage.deleteAll();
    }
  }

  Stream<AuthState> _mapLogOutLogin() async* {
    final secure = FlutterSecureStorage();

    await secure.deleteAll();
    yield LogOutState();
  }

  Stream<AuthState> _mapChangeFotoProfile(String image) async* {
    try {
      final secureStorage = FlutterSecureStorage();
      // gọi hàm 

      yield LoadingImageState();

      final resp = await authRepositories.updatedImageProfile(
          image: image,
          uidPerson: authRepositories.uidPersonStorage().toString());

      await secureStorage.write(key: 'profile', value: resp.profile);
      // ghi lại profile 

      await Future.delayed(Duration(seconds: 3));

      yield ChangeProfileSuccess();

      yield state.copyWith(
          profile: resp.profile,
          username: await secureStorage.read(key: 'user'),
          email: await secureStorage.read(key: 'email'),
          uid: await secureStorage.read(key: 'uid')); // sao chép state trường dữ liệu 
    } catch (e) {
      yield FailureSaveImage(error: e.toString());
    }
  }
}
