import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qize_app/screens/result.dart';

import '../model/model.dart';
import '../screens/HiPage.dart';

Hi hi = new Hi();

class main_controller extends GetxController {
  List<quiz_model> quiz = [
    quiz_model(
        question: 'how many seconds in one minute?',
        answers: ['20', '40', '30', '60'],
        correct_answer: '60'),
    quiz_model(
        question: 'how many letters in alphapet?',
        answers: ['25', '26', '27', '28'],
        correct_answer: '26'),
    quiz_model(
        question: 'what is the capital of france?',
        answers: ['rome', 'london', 'paris', 'cairo'],
        correct_answer: 'paris'),
    quiz_model(
        question: 'what is the capital of france?',
        answers: ['rome', 'london', 'paris', 'cairo'],
        correct_answer: 'rome'),
    quiz_model(
        question: 'what is the color of the sky on a clear day?',
        answers: ['pink', 'blue', 'gray', 'yellow'],
        correct_answer: 'blue'),
    quiz_model(
        question: 'how many days in the week?',
        answers: ['4', '5', '6', '7'],
        correct_answer: '7')
  ];
  int inde = 0;
  int count = 1;
  int Result = 0;
  String imaG = "";
  String phrase = "";
  Color Bcolor = Color(0xffF7F7F7);
  Color isTrue = Colors.green;
  Color isWrong = Colors.redAccent;
  Color maincolor = Colors.white;
  bool ispressed = false;
  int seconds = 0;
  String getValue = "";

  changeinde(index) {
    quiz[inde].answers[index] == quiz[inde].correct_answer ? correct() : go();
    Result >= 40 ? imaG = 'assets/winner.gif' : imaG = 'assets/tryagain.png';
    Result >= 40 ? phrase = 'congratulations' : phrase = 'try again';
    Result >= 40 ? Bcolor = Color(0xffF7F7F7) : Bcolor = Colors.white;
    update();
  }

  correct() async {
    await Future.delayed(const Duration(milliseconds: 200));
    Result = Result + 10;
    seconds = seconds + 16;
    count != 6 ? count++ : count = 1;
    inde != 5
        ? inde++
        : Get.to(() => result(
            Result: Result, imaG: imaG, phrase: phrase, getValue: getValue));
    ispressed = false;
    update();
  }

  go() {
    seconds = seconds + 16;
    count != 6 ? count++ : count = 1;
    inde != 5
        ? inde++
        : Get.to(() => result(
            Result: Result, imaG: imaG, phrase: phrase, getValue: getValue));
    update();
    ispressed = false;
    update();
  }
}
