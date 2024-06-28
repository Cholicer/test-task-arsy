// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_app/features/whatever/controllers/item_controller.dart';
import 'package:test_task_app/features/whatever/models/item_model.dart';

class ItemEditScreen extends StatelessWidget {
  const ItemEditScreen({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    final ItemController _itemController = Get.find();
    final _formKey = GlobalKey<FormState>();
    final _titleController = TextEditingController(text: item.title);
    final _descriptionController = TextEditingController(text: item.body);

    return Scaffold(
      appBar: AppBar(title: const Text('Редактировать элемент')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Название'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите название';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Описание'),
                maxLines: 5,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _itemController.updateItem(ItemModel(
                      id: item.id,
                      title: _titleController.text,
                      body: _descriptionController.text,
                    ));
                    Get.back();
                  }
                },
                child: const Text('Сохранить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
