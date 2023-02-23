import 'package:banking/customWidgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helpers/helpers.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

class InitialDetailScreen2 extends StatefulWidget {
  const InitialDetailScreen2({Key? key}) : super(key: key);

  @override
  State<InitialDetailScreen2> createState() => _InitialDetailScreenState();
}

class _InitialDetailScreenState extends State<InitialDetailScreen2> {

  String emailErrorText = "";
  String employeeStatus = "";
  int selectedValue = 0;
  int changedValue = 0;
  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
  List<String> listItem = ["Employed", "Self Employed", "Government", "Pensioner", "Employed", "Self Employed", "Government", "Pensioner", "Government"];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      //appBar: buildAppBar(),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///Space
                              const SizedBox(height: 16,),

                              ///Back arrow
                              Container(
                                transform: Matrix4.translationValues(-5.0, 0, 0.0),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  color: Colors.black,
                                  // padding: EdgeInsets.symmetric(horizontal: 0),
                                  icon: Icon(Icons.arrow_back, color: Colors.grey,size:30,),
                                  onPressed: () => Navigator.of(context).pop(false),
                                ),
                              ),

                              ///Space
                              const SizedBox(height: 25,),

                              ///Title
                              Text("Tell us about yourself!", style: TextStyle(color: HexColor("003087"), fontWeight: FontWeight.bold, fontSize: 28),),

                              ///Space
                              const SizedBox(height: 10,),

                              ///Subtitle
                              Text("This will help us show you products that suit you best.", style: TextStyle(color: HexColor("4e5f74"), fontWeight: FontWeight.normal, fontSize: 16),),

                              ///Space
                              const SizedBox(height: 30,),

                              /// Mobile number
                              CustomPrefixedTextField(title: "UAE mobile", placeholder: "Enter mobile number",
                                onSubmit: (value) { }, maxLimit: 9,
                                onChanged: (value) {}, prefix: "+971", isAmountField: false,),

                              ///Space
                              const SizedBox(height: 18,),

                              /// Email address
                              CustomTextField(title: "Email address", placeholder: "Enter email address",
                                onSubmit: (value){ print(value);  },
                                onChanged: (value) {
                                  print("Changing is $value");
                                  print("Error text is $emailErrorText ");
                                  setState(() {
                                    if (value.isEmpty) {
                                      emailErrorText = "Enter email address";
                                    } else if (!validateEmail(value)) {
                                      emailErrorText = "Enter valid email address";
                                    } else {
                                      emailErrorText = "";
                                    }
                                  });
                                  print(value);
                                }, keyboardType: TextInputType.emailAddress,
                                errorText: emailErrorText,
                              ),

                              ///Email error text
                              !emailErrorText.isEmpty ?
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Text(emailErrorText, style: TextStyle(color: HexColor("da291c"), fontWeight: FontWeight.normal, fontSize: 12),),
                              ) : const SizedBox(),

                              ///Space
                              const SizedBox(height: 10 ,),

                              ///Employment status - Drop down
                              // CustomDropDown(title: "Employment status", placeholder: "select employment status", listItem: ["Employed", "Self Employed", "Goverment", "Pensior"],
                              //     onPressed: (value) {
                              //       print("selected value is $value");
                              //       setState(() {
                              //         employeeStatus = value ?? "";
                              //       });
                              //     } ),
                              
                              Container(
                                  child:
                                  TextField(
                                      readOnly: true,
                                      // onTap: () {
                                      //   //Your code here
                                      // },
                                    decoration: InputDecoration(
                                      //errorText: "Please enter value",
                                      counterText: "",
                                      hintText: "$selectedValue",
                                      isDense: true,
                                      //prefixIconConstraints: BoxConstraints(minWidth: 20, minHeight: 0),
                                      //prefixText: "UAE",
                                      filled: true,
                                      fillColor: HexColor("f5f6f8"),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
                                      ),
                                      errorBorder:  OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1, color: HexColor("d3d7de")),
                                      ),
                                    ),

                                  // CustomPrefixedTextField(title: "UAE mobile", placeholder: "Enter mobile number",
                                  //   onSubmit: (value) { }, maxLimit: 9,
                                  //   onChanged: (value) {}, prefix: "+971", isAmountField: false,),
                                      onTap: () => showCupertinoModalPopup(context: context, builder: (_) =>
                                    SizedBox(width: double.infinity,
                                      height: 300 ,
                                      child:
                                      Container(
                                        height: 200.0,
                                        color: Colors.white,
                                        child:
                                        Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                ///Cancel button
                                                CupertinoButton(
                                                  child: Text("Cancel"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                ///Space
                                                Spacer(),
                                                ///OK Button
                                                CupertinoButton(
                                                  child: Text("Ok"),
                                                  onPressed: () {
                                                    setState(() {
                                                      selectedValue = changedValue;
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),

                                            ///Drop down lists
                                            Expanded(
                                              child: CupertinoPicker(
                                                  scrollController:
                                                  new FixedExtentScrollController(
                                                    initialItem: 0,
                                                  ),
                                                  itemExtent: 32.0,
                                                  backgroundColor: Colors.white,
                                                  onSelectedItemChanged: (int index) {
                                                    changedValue = index;
                                                  },
                                                  children: List<Widget>.generate(100,
                                                          (int index) {
                                                        return Center(
                                                          child: Text('${index+1}'),
                                                        );
                                                      })),
                                            ),
                                          ],
                                        ),
                                      )
                                      // CupertinoPicker(
                                      //   backgroundColor: Colors.white,
                                      //   itemExtent: 30,
                                      //   scrollController: FixedExtentScrollController(
                                      //     initialItem: 2,
                                      //   ),
                                      //   onSelectedItemChanged: (int value) {
                                      //     setState(() {
                                      //       selectedValue = value;
                                      //     });
                                      //   },
                                      //   children: [
                                      //     Text("0"),
                                      //     Text("1"),
                                      //     Text("2"),
                                      //     Text("3"),
                                      //     Text("4"),
                                      //     Text("5"),
                                      //     Text("6"),
                                      //     Text("7"),
                                      //     Text("8"),
                                      //     Text("9"),
                                      //   ],
                                      // ),
                                    ),


                              //         Column(children: [
                              //         CupertinoButton(
                              //             child: Text("Select Number :"),
                              //             onPressed: () {
                              //               showModalBottomSheet(
                              //                   context: context,
                              //                   builder: (BuildContext context) {
                              //                     return Container(
                              //                       height: 200.0,
                              //                       color: Colors.white,
                              //                       child: Row(
                              //                         crossAxisAlignment: CrossAxisAlignment.start,
                              //                         children: <Widget>[
                              //                           CupertinoButton(
                              //                             child: Text("Cancel"),
                              //                             onPressed: () {
                              //                               Navigator.pop(context);
                              //                             },
                              //                           ),
                              //                           Expanded(
                              //                             child: CupertinoPicker(
                              //                                 scrollController:
                              //                                 new FixedExtentScrollController(
                              //                                   initialItem: 0,
                              //                                 ),
                              //                                 itemExtent: 32.0,
                              //                                 backgroundColor: Colors.white,
                              //                                 onSelectedItemChanged: (int index) {
                              //                                   changedValue = index;
                              //                                 },
                              //                                 children: new List<Widget>.generate(100,
                              //                                         (int index) {
                              //                                       return new Center(
                              //                                         child: new Text('${index+1}'),
                              //                                       );
                              //                                     })),
                              //                           ),
                              //                           CupertinoButton(
                              //                             child: Text("Ok"),
                              //                             onPressed: () {
                              //                               setState(() {
                              //                                 selectedValue = changedValue;
                              //                               });
                              //                               Navigator.pop(context);
                              //                             },
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     );
                              //                   });
                              //             }),
                              //           Text(
                              //             '${selectedValue+1}',
                              //             style: TextStyle(fontSize: 18.0),
                              //           ),
                              //           SizedBox(
                              //             height: 20.0,
                              //           ),
                              //      //),
                              // //),
                              //   ],
                              //
                              // ),
                                      ),
                                  ),
                              ),

                              ///Space
                              const SizedBox(height: 18,),

                              /// Monthly salary
                              CustomPrefixedTextField(title: "Monthly salary", placeholder: "Enter monthly salary",
                                onSubmit: (value) { }, maxLimit: 9,
                                onChanged: (value) {}, prefix: "AED", isAmountField: true,),

                              ///Space
                              const SizedBox(height: 12,),

                              ///Hint
                              Visibility( visible: employeeStatus == "Employed",child: Text("Last salary credited to your bank account", style: TextStyle(color: HexColor("9fa9b8"), fontWeight: FontWeight.normal, fontSize: 13),)),

                              ///Space
                              const SizedBox(height: 12,),

                            ],
                          ),
                        ),
                        Column(
                          children: [
                            ///Continue button
                            Center(
                              child: SizedBox(
                                height:48, //height of button
                                width:width - 64.0,
                                child: ElevatedButton(
                                  child: Text("Continue", style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 16),),
                                  onPressed: () {
                                    Get.toNamed("/");
                                    //print("Value is ${Get.parameters['val']}");
                                    //print("channel is ${Get.parameters['channel']} and device is ${Get.parameters['device']}");
                                  }, // back(result: "Its going back"),
                                  style: ElevatedButton.styleFrom(
                                    primary: HexColor("003087"),
                                    onPrimary: Colors.white,
                                    //minimumSize: const Size.fromHeight(50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            ///Space
                            const SizedBox(height: 16,),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );

      Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () => Navigator.of(context).pop(false),
      //   ),
      //   title: Text('Find Devices'),
      //   actions: <Widget>[],
      // ),
        body:
        SafeArea(
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 10);
            },
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: listItem.length,
            itemBuilder: (context, index) {
              switch (index) {
                case 0 : return
                ///Title
                Text("Tell us about yourself!", style: TextStyle(color: HexColor("003087"), fontWeight: FontWeight.bold, fontSize: 28),);
                case 1 : return
                  ///Subtitle
                  Text("This will help us show you products that suit you best.", style: TextStyle(color: HexColor("4e5f74"), fontWeight: FontWeight.normal, fontSize: 16),);
                case 2 : return
                  /// Mobile number
                  CustomPrefixedTextField(title: "UAE mobile", placeholder: "Enter mobile number",
                    onSubmit: (value) { }, maxLimit: 9,
                    onChanged: (value) {}, prefix: "+971", isAmountField: false,);
                case 3 : return
                  /// Email address
                  CustomTextField(title: "Email address", placeholder: "Enter email address",
                    onSubmit: (value){ print(value);  },
                    onChanged: (value) {
                      print("Changing is $value");
                      print("Error text is $emailErrorText ");
                      setState(() {
                        if (value.isEmpty) {
                          emailErrorText = "Enter email address";
                        } else if (!validateEmail(value)) {
                          emailErrorText = "Enter valid email address";
                        } else {
                          emailErrorText = "";
                        }
                      });
                      print(value);
                    }, keyboardType: TextInputType.emailAddress,
                    errorText: emailErrorText,
                  );
                case 4: return
                  ///Email error text
                  !emailErrorText.isEmpty ?
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(emailErrorText, style: TextStyle(color: HexColor("da291c"), fontWeight: FontWeight.normal, fontSize: 12),),
                  ) : const SizedBox();
                case 5: return
                  ///Employment status - Drop down
                  CustomDropDown(title: "Employment status", placeholder: "select employment status", listItem: ["Employed", "Self Employed", "Goverment", "Pensior"],
                      onPressed: (value) {
                        print("selected value is $value");
                        setState(() {
                          employeeStatus = value ?? "";
                        });
                      } );
                case 6: return
                  /// Monthly salary
                  CustomPrefixedTextField(title: "Monthly salary", placeholder: "Enter monthly salary",
                    onSubmit: (value) { }, maxLimit: 9,
                    onChanged: (value) {}, prefix: "AED", isAmountField: true,);

                case 7 : return
                  ///Hint
                  employeeStatus == "Employed" ?
                  Text("Last salary credited to your bank account", style: TextStyle(color: HexColor("9fa9b8"), fontWeight: FontWeight.normal, fontSize: 13),)
                      : Container();
                case 8: return
                  ///Continue button
                  Center(
                    child: SizedBox(
                      height:48, //height of button
                      width:width - 64.0,
                      child: ElevatedButton(
                        child: Text("Continue", style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 16),),
                        onPressed: () => print("it's pressed"),
                        style: ElevatedButton.styleFrom(
                          primary: HexColor("003087"),
                          onPrimary: Colors.white,
                          //minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                  );
              default : return Container(color: Colors.blue, height: 50,);
              };},
              ),
        ),

    );
  }
}