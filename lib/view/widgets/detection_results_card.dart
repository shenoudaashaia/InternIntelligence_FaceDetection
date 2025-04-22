import 'package:flutter/material.dart';

class DetectionResultsCard extends StatelessWidget {
  final String resultText;
  final Color backgroundColor;

  const DetectionResultsCard({super.key, required this.resultText,this.backgroundColor = Colors.red,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      constraints: const BoxConstraints(minHeight: 200),
      decoration: BoxDecoration(
          color: backgroundColor,
       
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Detection Results',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo),
          ),
          const SizedBox(height: 8),
          SelectableText(
            resultText.isEmpty
                ? 'Face detection results will appear here'
                : resultText,
            style:
                TextStyle(fontSize: 16, height: 1.5, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}
