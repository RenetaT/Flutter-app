import 'package:flutter/material.dart';
import 'quizpage.dart';
import 'aboutpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Psychological test to determine your type of leader"),
        backgroundColor: const Color(0xFF45ADDF), //0xff3a21d9-darr blue,0xFF33CEFF lighter ,0xFF67BBE5
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFB1CFD8),//0xffa29ba0, светло 0xFFCCD8DC
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20), // padding appbar
            Align(
              alignment: Alignment.center,
              child:  Image.asset('assets/type.png',
                height: 250,
                fit: BoxFit.contain,
              )
            ),
            const Text("Scenario:\n"
                  "You are project manager leading a team to develop a new "
                  "product.\n "
                "A major team member Sahara has been consistently "
                  "missing deadlines \n and producing subpar work.\n\n"
              "Based on this scenario you are about to take a quiz to determine\n"
                " your type of leading",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },
              color: const Color(0xff3a21d9),
              textColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "Start",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
              color: const Color(0xff3a21d9),
              textColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                "About",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
