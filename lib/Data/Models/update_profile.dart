import 'dart:convert';

UpdateProfile authModelFromJson(String str) => UpdateProfile.fromJson(json.decode(str));

String authModelToJson(UpdateProfile data) => json.encode(data.toJson());

class UpdateProfile {
    UpdateProfile({
       required this.resp,
       required this.msj,
       required this.profile,
    });

    bool resp;
    String msj;
    String profile;

    factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
        resp: json["resp"],
        msj: json["msj"],
        profile: json["profile"],
    );

    Map<String, dynamic> toJson() => {
        "resp": resp,
        "msj": msj,
        "profile": profile,
    };
}
