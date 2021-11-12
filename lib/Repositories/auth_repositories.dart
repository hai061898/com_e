import 'dart:convert';

import 'package:e_com/Data/Models/auth_model.dart';
import 'package:e_com/Data/Models/response_models.dart';
import 'package:e_com/Data/Models/update_profile.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthRepositories {
  String server = 'http://127.0.0.1/api';
  // chỗi link api
  final secureStorage = const FlutterSecureStorage();
  // gọi hàm FlutterSecureStorage tác dụng jwt (mã hóa)
  Future<ResponseModels> createUsers(
      {required String user,
      required String email,
      required String password}) async {
    final resp = await http.post(Uri.parse('$server/register'),
        // gọi http phương thức post (lấy đg đẫn / register)
        headers: {'Accept': 'application/json'},
        // header : chuỗi định dạng json
        body: {'username': user, 'email': email, 'passwordd': password}
        // body lấy các thông số
        );

    return ResponseModels.fromJson(jsonDecode(resp.body));
    // trả kết quả về json
  }

  Future<AuthModel> login(
      {required String email, required String password}) async {
    final resp = await http.post(Uri.parse('$server/login'),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'passwordd': password});

    return AuthModel.fromJson(jsonDecode(resp.body));
  }

  Future<String?> readToken() async {
    //String? : ? biểu thị cho vc xem nó có cho null k
    return secureStorage.read(key: 'xtoken');
  }

  Future<AuthModel> renewToken() async {
    final token = await readToken();
    //gọi hàm readToken

    final resp = await http.get(Uri.parse('$server/login/renew'),
        headers: {'Accept': 'application/json', 'xx-token': token!}
        //chuỗi headers json
        );

    return AuthModel.fromJson(jsonDecode(resp.body));
  }

  Future<UpdateProfile> updatedImageProfile(
      {required String image, required String uidPerson}) async {
    final token = await readToken();
    var request = http.MultipartRequest(
        'PUT', Uri.parse('$server/update-image-profile'))
      //khi có nhiều luồng hoạt động ta xài MultipartRequest (phương thức put , đg đẫn upimage)
      // .. là thực hiện các sự kiên cùng lúc
      ..headers['Accept'] = 'application/json'
      ..headers['xx-token'] = token!
      ..fields['uidPerson'] = uidPerson // trường biểu mẫu
      ..files.add(
          await http.MultipartFile.fromPath('image', image)); // upload image
    // https://pub.dev/documentation/http/latest/http/MultipartRequest-class.html

    final resp = await request.send();
    // gữi yếu cầu

    var datas = await http.Response.fromStream(resp);
    // phản hồi về  stream

    return UpdateProfile.fromJson(jsonDecode(datas.body));
    // trả về json
  }

  Future<void> persistenToken(String token) async {
    await secureStorage.write(key: 'xtoken', value: token);
  }

  Future<String?> uidPersonStorage() async {
    return secureStorage.read(key: 'uid');
  }

  Future<bool> hasToken() async {
    var value = await secureStorage.read(key: 'xtoken');

    if (value != null) return true;
    return false;
  }

  Future<void> deleteToken() async {
    secureStorage.delete(key: 'xtoken');
    secureStorage.deleteAll();
  }
}

final authRepositories = AuthRepositories();
