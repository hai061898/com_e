part of 'auth_bloc.dart';


abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String? email;
  final String? password;

  LoginEvent({this.email, this.password});

}

class LogOutEvent extends AuthEvent {}


class CheckLoginEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String? username;
  final String? email;
  final String? password;

  RegisterEvent({this.username, this.email, this.password});
  
}

class ChangePictureProfile extends AuthEvent {
  final String? image;
  ChangePictureProfile({this.image});

}

// tóm lại đây sẽ định nghĩ các sự kiện xảy ra  với auth (event) và tham số đầu vào