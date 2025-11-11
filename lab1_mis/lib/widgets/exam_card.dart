import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.date.isBefore(now);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: exam);
      },
      child: Card(
        color: isPast ? Colors.grey.shade300 : Colors.blue.shade50,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isPast ? Colors.grey.shade500 : Colors.blue.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exam.subject,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 5),
                  Text("${exam.date.day}/${exam.date.month}/${exam.date.year}"),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.access_time),
                  const SizedBox(width: 5),
                  Text(
                      "${exam.date.hour.toString().padLeft(2, '0')}:${exam.date.minute.toString().padLeft(2, '0')}"),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 5),
                  Flexible(child: Text(exam.rooms.join(", "))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
