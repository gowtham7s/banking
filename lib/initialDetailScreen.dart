import 'package:banking/customWidgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'helpers/helpers.dart';
import 'dart:ui';

class InitialDetailScreen extends StatefulWidget {
  const InitialDetailScreen({Key? key}) : super(key: key);

  @override
  State<InitialDetailScreen> createState() => _InitialDetailScreenState();
}

class _InitialDetailScreenState extends State<InitialDetailScreen> {

  String emailErrorText = "";
  String employeeStatus = "";
  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () => Navigator.of(context).pop(false),
        //   ),
        //   title: Text('Find Devices'),
        //   actions: <Widget>[],
        // ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: height - 24),
                child: IntrinsicHeight(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
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

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          CustomDropDown(title: "Employment status", placeholder: "select employment status", listItem: ["Employed", "Self Employed", "Goverment", "Pensior"],
                              onPressed: (value) {
                            print("selected value is $value");
                            setState(() {
                              employeeStatus = value ?? "";
                            });
                          } ),

                          ///Space
                          const SizedBox(height: 18,),

                          /// Monthly salary
                          CustomPrefixedTextField(title: "Monthly salary", placeholder: "Enter monthly salary",
                              onSubmit: (value) { }, maxLimit: 9,
                              onChanged: (value) {}, prefix: "AED", isAmountField: true,),

                          ///Space
                          const SizedBox(height: 12,),

                          ///Hint
                          employeeStatus == "Employed" ?
                          Text("Last salary credited to your bank account", style: TextStyle(color: HexColor("9fa9b8"), fontWeight: FontWeight.normal, fontSize: 13),)
                          : Container(),
                          ///Space
                          const SizedBox(height: 200,),

                  // Container(
                  //   constraints: BoxConstraints(
                  //       maxHeight: MediaQuery.of(context).size.height * .30
                  //   ),
                  //   child:  Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //
                  //       children: [
                  //         Container(color: Colors.black,),
                  //         // growable childrens
                  //       ],
                  //     ),
                  // ),

                          // //Spacer(),
                          // Expanded(
                          //   flex: 2,
                          //   child: Container(
                          //     color: Colors.yellow,
                          //     height: 50,
                          //   ),
                          // ),
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
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}



///Reference Notes :
/*
Drop Down :

                  SizedBox(
                    height: 50,
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      isDense: false,
                      itemHeight: 50,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                      border: OutlineInputBorder( ),
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
                ), onChanged: (value) {  }, items: ["Employed", "Self Employed", "United Kingdom", "Other"].map((itemone){
                      return DropdownMenuItem(
                          value: itemone,
                          child: Text(itemone),
                      );
                    }).toList(),
                  ),
                  ),


 */
                  /*
                          Text("UAE mobile 2", style: TextStyle(color: HexColor("4e5f74"), fontWeight: FontWeight.normal, fontSize: 16),),

                          const SizedBox(height: 8,),

                          TextField(
                            inputFormatters: [ThousandsSeparatorInputFormatter()],
                            maxLength: 9,
                            keyboardType: TextInputType.phone,
                            cursorColor: HexColor("0c2340"),
                            style: TextStyle(color: HexColor("0c2340"), fontWeight: FontWeight.normal, fontSize: 16),
                            decoration: InputDecoration(
                              //errorText: "Please enter value",
                              isDense: true,
                              prefixIcon:Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                width: 80,
                                //color: Colors.red,
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("+971", style: TextStyle(color: HexColor("0c2340"), fontWeight: FontWeight.normal, fontSize: 16),),
                                      Spacer(),
                                      Container(padding: EdgeInsets.symmetric(horizontal: 10),width: 1, color: HexColor("d3d7de"), height: 28,),
                                    ],
                                  ),
                                ),
                              ),
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
                          ) */
