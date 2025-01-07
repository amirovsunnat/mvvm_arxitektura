import 'dart:convert';
import 'dart:developer';

import 'package:mvvm_architecture_darsi/common/network_constants.dart';
import 'package:mvvm_architecture_darsi/common/typdefs.dart';
import 'package:http/http.dart' as http;

class FlavourRepository {
  // GET ALL FLAVOURS
  Future<DataMap> getFlavours() async {
    final url = Uri.parse(NetworkConstants.flavourUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    }
    throw Exception(
        "Ta'mlar olishda xatolik yuz berdi. Iltimos qayta urinib ko'ring.");
  }

  // Delete flavour
  Future<bool> deletePost(String id) async {
    final url = Uri.parse("${NetworkConstants.deleteUrl}/$id");

    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return true;
    }
    throw Exception(
        "Postlarni olishda xatolik yuz berdi, iltimos qaytadan urinib ko'ring.\nSizda ayb yo'q bizda ayb.");
  }

// update flavour
  Future<bool> updatePost({
    required String id,
    required String name,
  }) async {
    final url = Uri.parse("${NetworkConstants.flavourUrl}/$id");
    final flavour = {"name": name};
    final response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(flavour),
    );

    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
