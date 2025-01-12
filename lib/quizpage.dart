import 'package:flutter/material.dart';
import 'node.dart';
import 'package:coursework_two/main.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late int currentNodeId;
  String question = "";
  String optionA = "";
  String optionB = "";
  String optionC = "";
  late int nextIdA;
  late int nextIdB;
  late int nextIdC;
  String image = "";

  @override
  void initState() {
    super.initState();
    currentNodeId = 1; // Започваме с ID 1
    updateQuestion();
  }

  void updateQuestion() {
    Node? currentNode = box.get(currentNodeId);

    setState(() {
      if (currentNode != null) {
        question = currentNode.question;

        if (currentNode.isFinal) {
          optionA = "";
          optionB = "";
          optionC = "";
          nextIdA = 0;
          nextIdB = 0;
          nextIdC = 0;
          image = currentNode.image.isNotEmpty
              ? 'assets/${currentNode.image}'
              : 'assets/default_image.jpeg';
        } else {
          optionA = currentNode.optionAText;
          nextIdA = currentNode.nextIdA;
          optionB = currentNode.optionBText;
          nextIdB = currentNode.nextIdB;
          optionC = currentNode.optionCText;
          nextIdC = currentNode.nextIdC;
          image = currentNode.image.isNotEmpty
              ? 'assets/${currentNode.image}'
              : "";
        }
      } else {
        // Ако възелът не съществува, показваме крайно съобщение
        question = "End of the test";
        optionA = "";
        optionB = "";
        optionC = "";
        image = 'assets/default_image.jpeg';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leader Quiz'),
        backgroundColor: const Color(0xFF45ADDF),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFB1CFD8),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: image.isNotEmpty
                  ? Image.asset(
                image,
                height: 350,
              )
                  : const SizedBox(),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                question,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  if (optionA.isNotEmpty)
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentNodeId = nextIdA;
                          updateQuestion();
                        });
                      },
                      color: const Color(0xff3a21d9),
                      textColor: Colors.white,
                      child: Text(optionA),
                    ),
                  const SizedBox(height: 10),
                  if (optionB.isNotEmpty)
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentNodeId = nextIdB;
                          updateQuestion();
                        });
                      },
                      color: const Color(0xff3a21d9),
                      textColor: Colors.white,
                      child: Text(optionB),
                    ),
                  const SizedBox(height: 10),
                  if (optionC.isNotEmpty)
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentNodeId = nextIdC;
                          updateQuestion();
                        });
                      },
                      color: const Color(0xff3a21d9),
                      textColor: Colors.white,
                      child: Text(optionC),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




//
// import 'package:flutter/material.dart';
// import 'node.dart';
// import 'package:coursework_two/main.dart';
//
// class QuizPage extends StatefulWidget {
//   //final List<Node> map; // Добавяне на map като параметър
//   const QuizPage({super.key});
//
//   @override
//   State<QuizPage> createState() => _QuizPageState();
//
// }
//
// class _QuizPageState extends State<QuizPage> {
//   late int currentNodeId;
//   String question = "";
//   String optionA = "";
//   String optionB = "";
//   String optionC = "";
//   late int nextIdA;
//   late int nextIdB;
//   late int nextIdC;
//   String image = "";
//
//   @override
//   void initState() {
//     super.initState();
//
//     if (map.isNotEmpty) {
//       currentNodeId = map.first.iD; // Начално ID
//       updateQuestion();
//     } else {
//       print("Error: Map is empty. Data not loaded.");
//     }
//   }
//
//   void updateQuestion() {
//     Node currentNode = map.firstWhere(
//           (node) => node.iD == currentNodeId,
//       orElse: () {
//         print("ID $currentNodeId not found.");
//         return Node(
//           0,
//           "End of the test",
//           "",
//           0,
//           "",
//           0,
//           "",
//           0,
//           image: "default_image.jpeg",
//           isFinal: true,
//         );
//       },
//     );
//
//     setState(() {
//       question = currentNode.question;
//
//       if (currentNode.isFinal) {
//         optionA = "";
//         optionB = "";
//         optionC = "";
//         nextIdA = 0;
//         nextIdB = 0;
//         nextIdC = 0;
//
//         image = currentNode.image.isNotEmpty
//             ? 'assets/${currentNode.image}'
//             : 'assets/default_image.jpeg';
//       } else {
//         optionA = currentNode.optionAText;
//         nextIdA = currentNode.nextIdA;
//         optionB = currentNode.optionBText;
//         nextIdB = currentNode.nextIdB;
//         optionC = currentNode.optionCText;
//         nextIdC = currentNode.nextIdC;
//
//         image =
//         currentNode.image.isNotEmpty ? 'assets/${currentNode.image}' : "";
//       }
//     });
//   }
//
//
//   @override
//
//   Widget build(BuildContext context) {
//
//
//
//     // Проверка дали е финален екран
//     Node currentNode = map.firstWhere(
//           (node) => node.iD == currentNodeId,
//       orElse: () => Node(
//         0,
//         "End of the test",
//         "",
//         0,
//         "",
//         0,
//         "",
//         0,
//         image: "default_image.jpeg",
//         isFinal: true,
//       ),
//     );
//
//
//     if (currentNode.isFinal) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Leader Quiz'),
//           backgroundColor: const Color(0xFF45ADDF),//0xff3a21d9
//           centerTitle: true,
//         ),
//         backgroundColor: const Color(0xFFB1CFD8),//0xffa29ba0 cream
//         body: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 20),
//                 if (image.isNotEmpty)
//                   Image.asset(
//                     image,
//                     height: 350,
//                     fit: BoxFit.contain,
//                   ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Container(
//                     constraints: const BoxConstraints(maxWidth: 600),
//                     child: Text(
//                       question.replaceAll(". ", ".\n\n"), // Форматиране на текста
//                       style: const TextStyle(
//                         fontSize: 25,
//                         color: Colors.black,
//                         height: 1.5,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(title:const  Text('Leader Quiz'),
//         backgroundColor: const Color(0xFF45ADDF),
//         centerTitle: true,),
//       backgroundColor: const Color(0xFFB1CFD8),// cream -0xffa29ba0
//       body:SingleChildScrollView (
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const SizedBox(height: 20),
//             Align(
//               alignment: Alignment.center,
//               child: image.isNotEmpty
//                   ? Image.asset(
//                 image,
//                 height: 350,
//               )
//                   : const SizedBox(),
//             ),
//             const SizedBox(height: 20),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Text(
//                 question,
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Align(
//               alignment: Alignment.center,
//               child: Column(
//                 children: [
//                   if (optionA.isNotEmpty)
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           currentNodeId = nextIdA;
//                           updateQuestion();
//                         });
//                       },
//                       color: const Color(0xff3a21d9),
//                       textColor: Colors.white,
//                       child: Text(optionA),
//                     ),
//                   const SizedBox(height: 10),
//                   if (optionB.isNotEmpty)
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           currentNodeId = nextIdB;
//                           updateQuestion();
//                         });
//                       },
//                       color: const Color(0xff3a21d9),
//                       textColor: Colors.white,
//                       child: Text(optionB),
//                     ),
//                   const SizedBox(height: 10),
//                   if (optionC.isNotEmpty)
//                     MaterialButton(
//                       onPressed: () {
//                         setState(() {
//                           currentNodeId = nextIdC;
//                           updateQuestion();
//                         });
//                       },
//                       color: const Color(0xff3a21d9),
//                       textColor: Colors.white,
//                       child: Text(optionC),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'node.dart';
// //
// // List<Node> map = []; // Списък с всички въпроси и отговори
// //
// // class QuizPage extends StatefulWidget {
// //   const QuizPage({super.key});
// //
// //   @override
// //   State<QuizPage> createState() => _QuizPageState();
// // }
// //
// // class _QuizPageState extends State<QuizPage> {
// //   late int currentNodeId; // Текущо ID
// //   String question = ""; // Текущ въпрос или резултат
// //   String optionA = ""; // Текст на опция A
// //   String optionB = ""; // Текст на опция B
// //   String optionC = ""; // Текст на опция C
// //   late int nextIdA; // Следващо ID за опция A
// //   late int nextIdB; // Следващо ID за опция B
// //   late int nextIdC; // Следващо ID за опция C
// //   String image = "";
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     // Задаване на началния въпрос
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       setState(() {
// //         currentNodeId = map.first.iD; // Начално ID
// //         updateQuestion();
// //       });
// //     });
// //   }
// //
// //   void updateQuestion() {
// //     Node currentNode = map.firstWhere(
// //           (node) => node.iD == currentNodeId,
// //       orElse: () {
// //         print("ID $currentNodeId не е намерено в map.");
// //         return Node(
// //           0,
// //           "End of the test",
// //           "",
// //           0,
// //           "",
// //           0,
// //           "",
// //           0,
// //           image: "default_image.jpeg",
// //           isFinal: true,
// //         );
// //       },
// //     );
// //
// //     setState(() {
// //       question = currentNode.question;
// //
// //       if (currentNode.isFinal) {
// //         optionA = "";
// //         optionB = "";
// //         optionC = "";
// //         nextIdA = 0;
// //         nextIdB = 0;
// //         nextIdC = 0;
// //
// //         image = currentNode.image.isNotEmpty
// //             ? 'assets/${currentNode.image}'
// //             : 'assets/default_image.jpeg';
// //       } else {
// //         optionA = currentNode.optionAText;
// //         nextIdA = currentNode.nextIdA;
// //         optionB = currentNode.optionBText;
// //         nextIdB = currentNode.nextIdB;
// //         optionC = currentNode.optionCText;
// //         nextIdC = currentNode.nextIdC;
// //
// //         image =
// //         currentNode.image.isNotEmpty ? 'assets/${currentNode.image}' : "";
// //       }
// //     });
// //   }
// //
// //   void handleOption(int nextId) {
// //     setState(() {
// //       currentNodeId = nextId;
// //       updateQuestion();
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xffa29ba0),
// //       appBar: AppBar(
// //         title: const Text("Leader Test"),
// //         backgroundColor: const Color(0xff3a21d9),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             if (image.isNotEmpty)
// //               Image.asset(
// //                 image,
// //                 height: 250,
// //               ),
// //             const SizedBox(height: 20),
// //             Text(
// //               question,
// //               style: const TextStyle(
// //                 fontSize: 24,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.white,
// //               ),
// //               textAlign: TextAlign.center,
// //             ),
// //             const SizedBox(height: 20),
// //             if (optionA.isNotEmpty)
// //               MaterialButton(
// //                 onPressed: () => handleOption(nextIdA),
// //                 color: const Color(0xff3a21d9),
// //                 textColor: Colors.white,
// //                 child: Text(optionA),
// //               ),
// //             const SizedBox(height: 10),
// //             if (optionB.isNotEmpty)
// //               MaterialButton(
// //                 onPressed: () => handleOption(nextIdB),
// //                 color: const Color(0xff3a21d9),
// //                 textColor: Colors.white,
// //                 child: Text(optionB),
// //               ),
// //             const SizedBox(height: 10),
// //             if (optionC.isNotEmpty)
// //               MaterialButton(
// //                 onPressed: () => handleOption(nextIdC),
// //                 color: const Color(0xff3a21d9),
// //                 textColor: Colors.white,
// //                 child: Text(optionC),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
