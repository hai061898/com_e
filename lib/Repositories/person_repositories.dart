import 'dart:convert';

import 'package:e_com/Data/Models/Response/personal.dart';
import 'package:e_com/Data/Models/response_models.dart';
import 'package:e_com/Repositories/auth_repositories.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class PersonalRepositories {
  String server = 'http://127.0.0.1/api';

  final secureStorage = const FlutterSecureStorage();

  Future<PersonalInformationResponse> getPersonalInformation() async {
    final token = await authRepositories.readToken();

    final resp = await http.get(Uri.parse('$server/get-personal-information'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return PersonalInformationResponse.fromJson(jsonDecode(resp.body));
  }

  Future<ResponseModels> registerPersonalInformation(
      {required String name,
      required String last,
      required String phone,
      required String address,
      required String reference}) async {
    final token = await authRepositories.readToken();

    final resp =
        await http.put(Uri.parse('$server/personal/register'), headers: {
      'Accept': 'application/json',
      'xx-token': token!
    }, body: {
      'name': name,
      'lastname': last,
      'phone': phone,
      'address': address,
      'reference': reference
    });

    return ResponseModels.fromJson(jsonDecode(resp.body));
  }

  Future<ResponseModels> addStreetAddress(
      {required String address, required String reference}) async {
    final token = await authRepositories.readToken();

    final resp = await http.put(Uri.parse('$server/update-street-address'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'address': address, 'reference': reference});

    return ResponseModels.fromJson(jsonDecode(resp.body));
  }
}

final personalRepositories = PersonalRepositories();
