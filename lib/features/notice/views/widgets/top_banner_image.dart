import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/widgets/web_view_screen.dart';
import 'package:jnu_alarm/features/notice/models/top_banner_model.dart';
import 'package:url_launcher/url_launcher.dart';

class TopBannerImage extends StatelessWidget {
  const TopBannerImage({
    super.key,
    required this.model,
  });

  final TopBannerModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (model.direction_url.isEmpty) return;
        if (model.is_external_browser) {
          final url = Uri.parse(model.direction_url);
          if (await canLaunchUrl(url)) {
            launchUrl(url, mode: LaunchMode.externalApplication);
          }
        } else {
          Navigator.of(context).pushNamed(
            WebViewScreen.routeName,
            arguments: WebViewScreenArgs(
              title: model.name,
              link: model.direction_url,
            ),
          );
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: FadeInImage(
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(model.image_url),
          fadeInDuration: const Duration(milliseconds: 200),
        ),
      ),
    );
  }
}

// 투명 이미지 데이터
final Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
  0x42,
  0x60,
  0x82,
]);
