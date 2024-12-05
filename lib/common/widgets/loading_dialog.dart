import 'package:flutter/material.dart';

class LoadingDialogBuilder {
  LoadingDialogBuilder(this.context);

  final BuildContext context;

  void showLoadingDialog(String text) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
            canPop: false,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              content: LoadingIndicator(text: text),
            ));
      },
    );
  }

  void hideLoadingDialog() {
    Navigator.of(context).pop();
  }
}

class LoadingIndicator extends StatelessWidget {
  final String text;

  const LoadingIndicator({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var displayedText = text;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _getLoadingIndicator(context),
          // _getHeading(context),
          _getText(displayedText),
        ],
      ),
    );
  }

  Padding _getLoadingIndicator(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: 32,
        height: 32,
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  // Widget _getHeading(context) {
  //   return const Padding(
  //       padding: EdgeInsets.only(bottom: 4),
  //       child: Text(
  //         '잠시만 기다려주세요 …',
  //         style: TextStyle(fontSize: 16),
  //         textAlign: TextAlign.center,
  //       ));
  // }

  Text _getText(String displayedText) {
    return Text(
      displayedText,
      style: const TextStyle(fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
    );
  }
}
