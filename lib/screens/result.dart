import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import 'mainPage.dart';

class result extends StatelessWidget {
  int Result;
  String imaG;
  String phrase;
  String getValue;

  result(
      {Key? key,
      required this.Result,
      required this.imaG,
      required this.phrase,
      required this.getValue})
      : super(key: key);
  main_controller controller = Get.find();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: controller.Bcolor,
      body: GetBuilder<main_controller>(builder: (controller) {
        return ListView(children: [
          Container(
            height: .4 * height,
            width: width * 2,
            child: Image(
              image: AssetImage(imaG),
            ),
          ),
          Center(
              child: Text('score',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
          Center(
              child: Text(Result.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(phrase,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                Text(' , ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                Text(getValue,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
              ],
            ),
          ),
          Center(
              child: GestureDetector(
            onTap: () {
              controller.count = 1;
              controller.inde = 0;
              controller.Result = 0;
              controller.seconds = 1;
              Get.off(() => Main());
            },
            child: Container(
                child: Center(child: Text('restart')),
                width: width * .75,
                height: 40,
                margin: EdgeInsets.only(top: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(colors: [
                    Colors.yellow,
                    Colors.orangeAccent,
                    Colors.deepOrange,
                  ]),
                )),
          ))
        ]);
      }),
    );
  }
}
