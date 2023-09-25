import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:qize_app/screens/result.dart';

import '../controller/controller.dart';

class Main extends StatelessWidget {
  Main({super.key});
  main_controller controller = Get.put(main_controller());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffF5AC4D),
      body: GetBuilder<main_controller>(
          init: main_controller(),
          builder: (controller) {
            return ListView(children: [
              Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black45,
                                    spreadRadius: 1,
                                    blurRadius: 10)
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          margin: EdgeInsets.only(top: 100),
                          width: width * .75,
                          height: .25 * height,
                          child: Center(
                            child: Column(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, left: 85),
                                child: Row(children: [
                                  Text(
                                    'question${controller.count}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  Text(
                                    '/6',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )
                                ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 20),
                                child: Text(
                                  controller.quiz[controller.inde].question,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )
                            ]),
                          ),
                        ),
                        Container(
                          width: .66 * width,
                          height: 300,
                          margin: EdgeInsets.only(top: 30),
                          child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: MaterialButton(
                                    onPressed: () {
                                      controller.ispressed = true;
                                      controller.update();
                                      controller.changeinde(index);
                                    },
                                    color: controller.ispressed
                                        ? controller.quiz[controller.inde]
                                                    .answers[index] ==
                                                controller.quiz[controller.inde]
                                                    .correct_answer
                                            ? controller.isTrue
                                            : controller.maincolor
                                        : controller.maincolor,
                                    height: 45,
                                    minWidth: width * .4,
                                    child: Text(controller
                                        .quiz[controller.inde].answers[index]),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 47,
                        )),
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) => Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: CircularPercentIndicator(
                              radius: 45,
                              progressColor: Colors.deepOrangeAccent,
                              percent: controller.seconds * .01,
                              center: Text('progress'),
                            ))),
                  ),
                  Center(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return result(
                            Result: controller.Result,
                            imaG: controller.imaG,
                            phrase: controller.phrase,
                            getValue: controller.getValue);
                      }));
                      controller.count = 1;
                      controller.inde = 0;
                      controller.Result = 0;
                    },
                    child: Container(
                        child: Center(child: Text('result')),
                        width: width * .75,
                        height: 40,
                        margin: EdgeInsets.only(top: 600),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.deepOrangeAccent,
                        )),
                  )),
                ],
              ),
            ]);
          }),
    );
  }
}
