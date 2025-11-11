import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Exam> exams = [
    Exam(subject: "Мобилни информациски системи", date: DateTime(2025, 11, 7, 10, 0), rooms: ["215", "200а"]),
    Exam(subject: "Веб програмирање", date: DateTime(2025, 11, 10, 12, 30), rooms: ["200аб"]),
    Exam(subject: "Бази на податоци", date: DateTime(2025, 11, 11, 9, 0), rooms: ["138", "200аб"]),
    Exam(subject: "Веб програмирање", date: DateTime(2025, 11, 28, 11, 0), rooms: ["215"]),
    Exam(subject: "Програмирање на видео игри", date: DateTime(2025, 11, 30, 13, 0), rooms: ["117"]),
    Exam(subject: "Биснис статистика", date: DateTime(2025, 12, 2, 10, 30), rooms: ["13", "12"]),
    Exam(subject: "Структурно програмирање", date: DateTime(2025, 12, 5, 12, 0), rooms: ["2", "3"]),
    Exam(subject: "Објектно програмирање", date: DateTime(2025, 12, 7, 14, 0), rooms: ["13"]),
    Exam(subject: "Интернет програмирање", date: DateTime(2025, 12, 10, 9, 0), rooms: ["117", "138", "13", "215"]),
    Exam(subject: "Електронска и мобилна трговија", date: DateTime(2025, 12, 12, 11, 0), rooms: ["13"]),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.date.compareTo(b.date));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 223015"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: exams.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            return ExamCard(exam: exams[index]);
          },
        ),
      )
    );
  }
}
