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
        home: PaymentPage(
          transaction: Transaction(
            food: mockFoods[1], 
            user: mockUser, 
            quantity: 2,
            total: (mockFoods[1].price * 2 * 1.1).toInt() + 50000,
            id: 2412123,
          ),
        ),
    );
  }
}
