import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homepage.dart';
import 'node.dart';

//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box<Node> box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive setup
  await Hive.initFlutter();
  Hive.registerAdapter(NodeAdapter());
  box = await Hive.openBox<Node>('nodes');

  try {
    // Load and parse CSV data
    String fileData = await rootBundle.loadString("assets/cw_2.csv");
    List<String> rows = fileData.split("\n");

    for (String row in rows) {
      List<String> itemInRow = row.split(",");

      if (itemInRow.length == 3) {
        // Final node processing
        String imagePath = itemInRow[2].trim();
        Node node = Node(
          int.parse(itemInRow[0]),
          // ID
          itemInRow[1],
          // Result text
          "",
          0,
          "",
          0,
          "",
          0,
          image: imagePath.isNotEmpty ? imagePath : "default_image.jpeg",
          isFinal: true,
        );
        box.put(node.iD, node);
      } else if (itemInRow.length >= 9) {
        // Question node processing
        Node node = Node(
          int.parse(itemInRow[0]),
          // ID
          itemInRow[1],
          // Question text
          itemInRow[2],
          // Option A text
          int.parse(itemInRow[3]),
          // Next ID for A
          itemInRow[4],
          // Option B text
          int.parse(itemInRow[5]),
          // Next ID for B
          itemInRow[6],
          // Option C text
          int.parse(itemInRow[7]),
          // Next ID for C
          image: itemInRow[8].trim(), // Image name
        );
        box.put(node.iD, node);
      }
    }
  } catch (e) {
    print("Error loading data: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leader Test',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: const HomePage(),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'homepage.dart';
// import 'node.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
//
// //replace this with late Box<Node> box; List<Node> map = []; // Глобална променлива за съхранение на въпросите и отговорите
// late Box<Node> box;
//
// Future main() async { //void main() async
//   WidgetsFlutterBinding.ensureInitialized();
//   //insert code here
//
//   await Hive.initFlutter();   //HIVE SETUP
//   Hive.registerAdapter(NodeAdapter());
//   await Hive.openBox<Node>('nodes');
//
//
//   try {
//     // Зареждане на CSV файла
//     String fileData = await rootBundle.loadString("assets/cw_2.csv");
//
//     // Прочитане и обработка на CSV редовете
//     List<String> rows = fileData.split("\n");
//     for (String row in rows) {
//       List<String> itemInRow = row.split(",");
//
//       if (itemInRow.length == 3) {
//         // Обработка на финален възел
//         String imagePath = itemInRow[2].trim();
//         map.add(Node(
//           int.parse(itemInRow[0]), // ID
//           itemInRow[1], // Текст на резултата
//           "", 0, "", 0, "", 0,
//           image: imagePath.isNotEmpty ? imagePath : "default_image.jpeg",
//           isFinal: true,
//         ));
//       } else if (itemInRow.length >= 9) {
//         // Обработка на въпрос
//         map.add(Node(
//           int.parse(itemInRow[0]), // ID
//           itemInRow[1], // Въпрос
//           itemInRow[2], // Отговор A
//           int.parse(itemInRow[3]), // Следващо ID за A
//           itemInRow[4], // Отговор B
//           int.parse(itemInRow[5]), // Следващо ID за B
//           itemInRow[6], // Отговор C
//           int.parse(itemInRow[7]), // Следващо ID за C
//           image: itemInRow[8].trim(), // Име на изображението
//         ));
//       }
//     }
//   } catch (e) {
//     print("Error loading data: $e");
//   }
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Leader Test',
//       theme: ThemeData(primarySwatch: Colors.lightBlue),
//       home: const HomePage(),
//
//     );
//   }
// }
//
