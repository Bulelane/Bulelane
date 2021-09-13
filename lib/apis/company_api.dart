import 'dart:convert';

import 'package:project/models/company.dart';
import 'package:http/http.dart' as http;

class CompanyAPI {
  String baseURL = "http://localhost/api_hindi";

  Future<List<Company>> findAll() async {
    var response = await http.get(Uri.parse("${baseURL}/api-fetch-all.php"));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((company) => Company.fromJson(company)).toList();
    } else {
      throw Exception("Failed to upload company list");
    }
  }

  Future<Company> find(String id) async {
    var response =
        await http.get(Uri.parse("${baseURL}/single_company.php/?id=$id"));

    if (response.statusCode == 200) {
      return Company.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to upload company list");
    }
  }

  Future<Company> addCompany(
      String name, String email, String telephone, String country) async {
    final String apiUrl = "${baseURL}/api-insert.php";

    final response = await http.post(Uri.parse(apiUrl), body: {
      "name": name,
      "email": email,
      "telephone": telephone,
      "country": country
    });

    if (response.statusCode == 200) {
      final String responseString = response.body;

      return companyFromJson(responseString);
    } else {
      return Future.error("failed");
    }
  }

  Future<Company> deleteCompany(String id) async {
    final String apiUrl = "${baseURL}/api-delete.php/?id=$id";

    final response = await http.delete(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Company.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete company');
    }

  }
}
