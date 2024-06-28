import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_task_app/features/whatever/models/item_model.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000'; // Или любой другой Fake API

  Future<List<ItemModel>> getItems() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => ItemModel.fromJson(item)).toList();
    } else {
      throw Exception('Не удалось загрузить данные');
    }
  }

  Future<void> updateItem(ItemModel item) async {
    final response = await http.put(
      Uri.parse('$baseUrl/posts/${item.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(item.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Не удалось обновить данные');
    }
  }
}
