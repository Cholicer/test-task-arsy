import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_task_app/features/whatever/models/item_model.dart';

class ApiService {
  static const String baseUrl = 'https://mock-json-server-arsy.onrender.com';

  Future<List<ItemModel>> getItems() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/transactions'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonArray = json.decode(response.body) as List<dynamic>;
        return jsonArray.map((item) => ItemModel.fromJson(item)).toList();
      } else {
        throw Exception('Ошибка загрузки данных: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Ошибка при выполнении запроса: $e');
      }
      rethrow;
    }
  }

  Future<void> updateItem(int itemId, Map<String, String> newItem) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl/transactions/$itemId'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(newItem),
      );

      if (response.statusCode != 200) {
        throw Exception('Не удалось обновить данные');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Ошибка при выполнении запроса: $e');
      }
      rethrow;
    }
  }
}
