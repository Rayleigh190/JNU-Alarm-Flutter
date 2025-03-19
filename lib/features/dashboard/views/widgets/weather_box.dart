import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';

class WeatherBox extends StatelessWidget {
  final String imageUrl;
  final String temperature;

  const WeatherBox({
    super.key,
    required this.imageUrl,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.network(
          width: 60,
          imageUrl,
          placeholderBuilder: (context) => const SizedBox(
            width: 60,
            height: 60,
          ),
        ),
        Gaps.h6,
        Text(
          "$temperature°C",
          style: const TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
        ),
      ],
    );
  }
}
