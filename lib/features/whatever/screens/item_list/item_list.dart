// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_app/features/whatever/controllers/item_controller.dart';
import 'package:test_task_app/features/whatever/screens/item_edit/item_edit.dart';
import 'package:test_task_app/features/whatever/screens/item_list/widgets/item_list_tile.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemController _itemController = Get.put(ItemController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Список элементов'),
      ),
      body: Obx(
        () => _itemController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: _itemController.items.length,
                padding: const EdgeInsets.only(bottom: 16),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 16);
                },
                itemBuilder: (context, index) {
                  final item = _itemController.items[index];
                  return ItemListTile(
                    item: item,
                    onTap: () => Get.to(
                      () => ItemEditScreen(item: item),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
