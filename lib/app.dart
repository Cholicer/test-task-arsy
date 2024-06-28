import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task_app/features/whatever/screens/item_list/item_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ItemListScreen(),
    );
  }
}
