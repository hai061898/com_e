part of 'auth_bloc.dart';

class AuthState {
  final String uid;
  final String username;
  final String email;
  final String profile;

  AuthState(
      {this.uid = '0',
      this.username = '--',
      this.email = '-',
      this.profile = ''}); // khởi tạo giá trị

  AuthState copyWith(
          {String? uid, String? username, String? email, String? profile})
      //tạo bản sao các trường dử liệu =>
      =>
      AuthState(
          uid: uid ?? this.uid, // ?? la null : this.uid
          username: username ?? this.username,
          email: email ?? this.email,
          profile: profile ?? this.profile);
  // => viết tắc của {  }  chứa 1 biểu thức
}
//-------------------------------------//

class LoadingState extends AuthState {}

class LogInState extends AuthState {}

class LogOutState extends AuthState {}

class FailureState extends AuthState {
  final String? error;

  FailureState({this.error});
}

//-------------------------------------//
class LoadingRegisterState extends AuthState {}

class RegisterSuccess extends AuthState {}

class FailureRegisterState extends AuthState {
  final String? error;

  FailureRegisterState({this.error});
}
//--------------------------------//

class LoadingImageState extends AuthState {}

class ChangeProfileSuccess extends AuthState {}

class FailureSaveImage extends AuthState {
  final String? error;

  FailureSaveImage({this.error});
}
