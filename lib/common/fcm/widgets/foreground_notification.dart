import 'package:flutter/material.dart';

class ForegroundNotification extends StatefulWidget {
  final String title;
  final String body;
  final VoidCallback? onBannerDismissed;

  const ForegroundNotification({
    super.key,
    required this.title,
    required this.body,
    this.onBannerDismissed,
  });

  @override
  State<ForegroundNotification> createState() => _ForegroundNotificationState();
}

class _ForegroundNotificationState extends State<ForegroundNotification>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _playAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() async {
    // fist will show banner with forward.
    await _controller.forward();
    // wait for 3 second and then play reverse animation to hide the banner
    // Duration can be passed as parameter, banner will wait this much and then will dismiss
    await Future<void>.delayed(const Duration(seconds: 3));
    await _controller.reverse();
    // call onDismissedCallback so OverlayWidget can remove and clear the OverlayEntry.
    widget.onBannerDismissed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        final double animationValue =
            Curves.easeOut.transform(_controller.value);
        return FractionalTranslation(
          translation: Offset(0, -(2 - animationValue * 2)),
          child: child,
        );
      },
      animation: _controller,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF323430),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.body,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
