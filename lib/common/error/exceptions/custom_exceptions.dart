import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_exceptions.freezed.dart';

@freezed
class NetworkConnectivityException with _$NetworkConnectivityException {
  const factory NetworkConnectivityException.noNetwork(String message) =
      NoNetworkConnectivityException;
}

Future<void> showErrorAlert(BuildContext context, String message) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("오류"),
      content: Text(message),
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
