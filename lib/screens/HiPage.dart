import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import 'mainPage.dart';

class Hi extends StatelessWidget {
  Hi({super.key});
  main_controller controller = Get.put(main_controller());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController inputController = new TextEditingController();

    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: .4 * height,
            width: width * 2,
            child: Image.asset('assets/img.png'),
            color: Color(0xffF9E7D9)),
        Container(
            height: .8 * height,
            width: width,
            margin: EdgeInsets.only(top: .3 * height),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, left: 30),
                  child: Text(
                    'Let’s start a quiz',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 65, left: 30),
                  child: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                      onTap: () {
                        controller.getValue = inputController.text;
                        controller.update();
                      },
                      controller: inputController,
                      decoration: InputDecoration(
                          hintText: "enter your name",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffBE5528)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))))),
                ),
                GestureDetector(
                  onTap: () {
                    controller.getValue = inputController.text;
                    controller.update();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Main();
                    }));
                  },
                  child: Container(
                      child: Center(child: Text('start')),
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 200),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(colors: [
                            Colors.yellow,
                            Colors.orangeAccent,
                            Colors.deepOrange,
                          ]))),
                ),
                SizedBox(
                  height: 190,
                )
              ],
            )),
      ],
    ));
  }
}
