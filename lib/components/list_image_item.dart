import 'dart:typed_data';
import 'package:flutter/material.dart';

class ListImageItem extends StatelessWidget {
  const ListImageItem({
    super.key,
    required this.index,
    required this.onDelete,
    required this.imageBytes,
    this.width = 48,
    this.height = 64,
  });
  final int index;
  final Uint8List imageBytes;
  final VoidCallback onDelete;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Image.memory(
            imageBytes,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 20,
            top: -8,
            child: IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
