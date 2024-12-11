import 'package:flutter/material.dart';
import 'package:jnu_alarm/constants/sizes.dart';

class NoticeDivider extends StatelessWidget {
  const NoticeDivider({super.key, required String text}) : _text = text;

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFEDECE8),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size12,
              vertical: Sizes.size5,
            ),
            child: Text(
              _text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: Sizes.size12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
