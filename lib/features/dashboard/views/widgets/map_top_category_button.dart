import 'package:flutter/material.dart';

class MapTopCategoryButton extends StatelessWidget {
  const MapTopCategoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 0.8,
            spreadRadius: 0.8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: const Text(
        "🏫학교",
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
