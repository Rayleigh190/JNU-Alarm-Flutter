import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jnu_alarm/error/global_error_handler.dart';

class GlobalErrorListener extends StatefulWidget {
  final Widget child;

  const GlobalErrorListener({super.key, required this.child});

  @override
  State<GlobalErrorListener> createState() => _GlobalErrorListenerState();
}

class _GlobalErrorListenerState extends State<GlobalErrorListener> {
  late final StreamSubscription<String> _errorSubscription;

  @override
  void initState() {
    super.initState();
    _errorSubscription = GlobalErrorHandler().errors.listen((errorMessage) {
      _showErrorAlert(errorMessage);
    });
  }

  void _showErrorAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'OK',
              style: TextStyle(
                color: CupertinoColors.systemBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _errorSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
