import 'package:flutter/material.dart';
import 'package:foodmarket/ui/pages/pages.dart';
import 'package:get/get.dart';

import 'models/models.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FoodDetailPage(
          transaction: Transaction(food: mockFoods[0]),
        ),
    );
  }
}
