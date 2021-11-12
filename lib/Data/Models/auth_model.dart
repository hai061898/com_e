import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  
    bool resp;
    String msj;
    Users users;
    String token;

    AuthModel({
       required this.resp,
       required this.msj,
       required this.users,
       required this.token,
    });

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        resp: json["resp"],
        msj: json["msj"],
        users: Users.fromJson(json["users"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "users": users.toJson(),
        "token": token,
    };
}

class Users {
    Users({
      required this.id,
      required this.email,
      required this.users,
      required this.profile
    });

    int id;
    String email;
    String users;
    String profile;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        email: json["email"],
        users: json["users"],
        profile: json["profile"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "users": users,
        "profile": profile,
    };
}

