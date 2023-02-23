import 'dart:ui';

import 'package:banking/models/Student.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  // var student = Student();
  //
  // convertToUppercase() {
  //   student.name.value = student.name.value.toUpperCase();
  // }

  var student = Student(name: "Gowtham", age: 24).obs;

  convertToUppercase() {
    student.update((stud) {
      stud?.name = stud.name.toString().toUpperCase();
    });
  }
}

class CounterController extends GetxController {
  var count = 0; //0.obs;

  // increment() {
  //   count++;
  //   update();
  // }

  increment() async {
    await Future.delayed(Duration(seconds: 1)); //await Future<int>.delayed(const Duration(seconds: 3));
    count++;
    update(['unique']);
  }

  cleanUpTask() {
    print("Cleanup done");
  }
}

class TranslateController extends GetxController {
  changeLanguage(var param1, var param2) {
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }
}