
import 'package:banking/controllers/myController.dart';
import 'package:banking/initialDetailScreen.dart';
import 'package:banking/initialDetailsScreen2.dart';
import 'package:banking/messages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Internationalization extends StatelessWidget {
  const Internationalization({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // CounterController counterController = Get.put(CounterController());
    TranslateController translateController = Get.put(TranslateController());

    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('en', 'US'), //default - can get device locale using Get.deviceLocale
      fallbackLocale: Locale('ta', 'IN'), //
      title: "Translations",
      home: Scaffold(
        appBar: AppBar(title: Text("Translations title")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('hello'.tr),

              TextButton(onPressed: (){
                translateController.changeLanguage('hi', 'IN');
              }, child: Text("Hindi")),

              TextButton(onPressed: (){
                translateController.changeLanguage('en', 'US');
              }, child: Text("English")),

              TextButton(onPressed: (){
                translateController.changeLanguage('ta', 'IN');
              }, child: Text("Tamil")),

              TextButton(onPressed: (){
                translateController.changeLanguage('kn', 'IN');
              }, child: Text("kannada")),
            ],
          ),
        ),
      ),
    );
  }
}