import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "설정",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: const Center(
        child: Text("설정 화면"),
      ),
    );
  }
}
