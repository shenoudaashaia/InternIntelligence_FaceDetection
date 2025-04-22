import 'dart:io';
import 'package:flutter/material.dart';

class ImageDisplayCard extends StatelessWidget {
  final File? image;

  const ImageDisplayCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset:const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: image == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.face_retouching_natural,
                        size: 80, color: Colors.indigo.withOpacity(0.3)),
                     const SizedBox(height: 16),
                    Text(
                      'No image selected',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              )
            : Image.file(image!, fit: BoxFit.cover),
      ),
    );
  }
}
