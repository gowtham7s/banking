
import 'dart:ffi';

import 'package:banking/controllers/myController.dart';
import 'package:banking/initialDetailScreen.dart';
import 'package:banking/initialDetailsScreen2.dart';
import 'package:banking/models/Student.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class GetXApp extends StatelessWidget {
  const GetXApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.put(CounterController());
    // MyController myController = Get.put(MyController());
    // var student = Student();
    // final student = Student(name: "Gowtham", age: 22).obs;
    // var count = 0.obs;

    // void increment() {
    //   count++;
    // }

    return GetMaterialApp(
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(name: '/', page: () => GetXApp()),
        GetPage(name: '/second/:val', page: () => InitialDetailScreen2()),
        GetPage(name: '/home', page: () => InitialDetailScreen(), transition: Transition.cupertino),
      ],
      unknownRoute: GetPage(name: '/notfound', page: () => MyApp()),
      title: "Snackbar",
      home: Scaffold(
        appBar: AppBar(title: Text("Snackbar2")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CounterController>(
                // init: CounterController(),
                initState: (data) => counterController.increment(),
                dispose: (data) => counterController.cleanUpTask(),
                builder: (counterController2) {
                  return Text("count is ${counterController.count}");
                },
              ),

              GetBuilder<CounterController>(
                id: 'unique',
                // init: CounterController(),
                builder: (counterController2) {
                  return Text("\ncount2 is ${counterController.count}");
                },
              ),
              // Obx (() => Text("count is ${myController.student.value.name}")), // student.name.value for variable change

              TextField(onChanged: (val) {
                counterController.increment();
              }),

              TextButton(onPressed: (){
                counterController.increment();
                // Get.find<CounterController>().increment();

                ///Update getx Controller class
                // myController.convertToUppercase();

                ///Update entire class
                // student.update((stud) {
                //   stud?.name = stud.name.toString().toUpperCase();
                // });

                ///change name variable using obs
                // student.name.value = student.name.value.toUpperCase();

                ///Increment count func call
                // increment();

                ///Routing
                // Get.toNamed("/home");

                // Get.to(() => InitialDetailScreen(),
                //   arguments: "ITs coming from last screen",
                //   fullscreenDialog: true,
                //   transition: Transition.zoom,
                //   // duration: Duration(milliseconds: 3000),
                //   curve: Curves.bounceOut,
                // );

                ///Bottom Sheet
                // Get.bottomSheet(
                //   Wrap(
                //     children: [
                //       TextButton(onPressed: () {
                //         Get.changeTheme(ThemeData.light());
                //       }, child: Text("Light theme")),
                //
                //       TextButton(onPressed: () {
                //         Get.changeTheme(ThemeData.dark());
                //       }, child: Text("Dark theme")),
                //
                //       TextButton(onPressed: () {
                //         Get.back();
                //       }, child: Text("Close")),
                //
                //       TextButton(onPressed: () {
                //         Get.to(InitialDetailScreen(),
                //         fullscreenDialog: true,
                //         );
                //       }, child: Text("Home")),
                //
                //       TextButton(onPressed: () {
                //         Get.back();
                //       }, child: Text("Back"))
                //     ],
                //   ),
                //   barrierColor: Colors.greenAccent.shade100,
                //   backgroundColor: Colors.purple,
                //   isDismissible: false,
                //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                //   enableDrag: false,
                // );

                 ///Dialogue box
                // Get.defaultDialog(
                //   title: "Title",
                //   //middleText: "ITs message"
                //   content: CircularProgressIndicator(),
                //   textCancel: "Cancel",
                //   textConfirm: "OK",
                //   onConfirm: () {
                //     print("OK Pressed");
                //   },
                //   actions: [
                //     Expanded(child: TextButton(onPressed: () { Get.back();}, child: Text("Go Back"))),
                //   ],
                //   barrierDismissible: false,
                // );

                ///Snack bar
                // Get.snackbar("Title", "This is the message",
                //   snackPosition: SnackPosition.BOTTOM
                // );


              }, child: Text("Show Widget")),
            ],
          ),
        ),
      ),
    );
  }
}