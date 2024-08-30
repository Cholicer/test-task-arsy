import 'package:get/get.dart';
import 'package:test_task_app/data/services/api/api_service.dart';
import 'package:test_task_app/features/whatever/models/item_model.dart';

class ItemController extends GetxController {
  final ApiService _apiService = ApiService();
  RxList<ItemModel> items = <ItemModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchItems();
    super.onInit();
  }

  Future<void> fetchItems() async {
    isLoading.value = true;
    try {
      items.value = await _apiService.getItems();
    } catch (e) {
      Get.snackbar('Ошибка', 'Не удалось загрузить данные: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateItem(int itemId, Map<String, String> newItem) async {
    try {
      await _apiService.updateItem(itemId, newItem);

      final index = items.indexWhere((element) => element.id == itemId);
      if (index != -1) {
        items[index] = items[index].copyWith(
          description: newItem['description'],
          category: newItem['category'],
        );
      }
      Get.snackbar('Успех', 'Данные обновлены');
    } catch (e) {
      Get.snackbar('Ошибка', 'Не удалось обновить данные: $e');
    }
  }
}
