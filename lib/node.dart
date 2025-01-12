 import 'package:hive/hive.dart';

 part 'node.g.dart';


@HiveType(typeId:0)
class Node {

@HiveField(0)
   int iD;

@HiveField(1)
   String question;

@HiveField(2)
   String optionAText;

@HiveField(3)
   int nextIdA;

@HiveField(4)
  String optionBText;

@HiveField(5)
   int nextIdB;

@HiveField(6)
   String optionCText;

@HiveField(7)
   int nextIdC;

@HiveField(8)
   bool isFinal;

@HiveField(9)
   String image; // Ново поле за изображението

  Node(
      this.iD,
      this.question,
      this.optionAText,
      this.nextIdA,
      this.optionBText,
      this.nextIdB,
      this.optionCText,
      this.nextIdC, {

        this.isFinal = false,
        this.image = "",
      });
}


 // Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows
 //
 // PS C:\Users\HP ProBook 455 G9\OneDrive\Desktop\up2246775_v3_database> flutter pub run build_runner build
 // Deprecated. Use `dart run` instead.
 // [INFO] Generating build script completed, took 364ms
 // [INFO] Reading cached asset graph completed, took 103ms
 // [INFO] Checking for updates since last build completed, took 481ms
 // [SEVERE] hive_generator on lib/node.dart:
 //
 // This builder requires Dart inputs without syntax errors.
 // However, package:coursework_two/node.dart (or an existing part) contains the following errors.
 // node.dart:3:7: Expected a string literal.
 // node.dart:3:2: Expected to find ';'.
 // node.dart:3:7: Functions must have an explicit list of parameters.
 // And 9 more...
 //
 // Try fixing the errors and re-running the build.
 //
 // [INFO] Running build completed, took 1.0s
 // [INFO] Caching finalized dependency graph completed, took 58ms
 // [SEVERE] Failed after 1.1s
 // PS C:\Users\HP ProBook 455 G9\OneDrive\Desktop\up2246775_v3_database>







// class Node {
//   int iD; // ID
//   String question; // text
//   String optionAText; // text for option a
//   int nextIdA; // opt A lead to
//   String optionBText; // text for option b
//   int nextIdB; // opt b lead to
//   String optionCText; // Текст за опция C
//   int nextIdC; // Следващ въпрос за опция C
//   bool isFinal; // Дали въпросът е краен (резултат)
//   String image;
//   Node(
//       this.iD,
//       this.question,
//       this.optionAText,
//       this.nextIdA,
//       this.optionBText,
//       this.nextIdB,
//       this.optionCText,
//       this.nextIdC, {
//         this.isFinal = false,
//         this.image= "",
//       });
// }




//,ID,TEXT, ANSWER A Text,Leads to ,ANSWER B,Leads to ,ANSWER C,Leads to
// import 'dart:core';
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
//
//
// class Node{
//
//   int iD; //1
//   String question;//How would you approach this situation?
//   String optionAText;//A)Schedule one to one meeting with Sarah to discuss the issues
//   int nextIdA;//2
//   String optionBText;//B)Escalate the issue to your manager
//   int nextIdB;//5
//   String optionCText;//C)Ignore this issues and continue working with the rest of the team
//   int nextIdC;//6
//
//   Node(this.iD,this.question,this.optionAText,this.nextIdA,
//       this.optionBText,this.nextIdB, this.optionCText,
//       this.nextIdC);
//
//
// }