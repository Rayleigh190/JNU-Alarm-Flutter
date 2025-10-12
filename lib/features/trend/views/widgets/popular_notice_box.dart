import 'package:flutter/material.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/features/trend/models/popular_notice_item_model.dart';
import 'package:jnu_alarm/features/trend/views/widgets/popular_notice_item.dart';

class PopularNoticesBox extends StatelessWidget {
  final String title;
  final List<PopularNoticeItemModel> items;
  final bool? isLoading;

  const PopularNoticesBox({
    super.key,
    required this.title,
    required this.items,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size16,
          ),
        ),
        Gaps.v2,
        Stack(
          children: [
            PopularNoticeContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PopularNoticeItem(
                    rank: "1",
                    body: items.isNotEmpty ? items[0].body : "-",
                    hits: items.isNotEmpty ? items[0].hits : 0,
                  ),
                  Gaps.v10,
                  PopularNoticeItem(
                    rank: "2",
                    body: items.length > 1 ? items[1].body : "-",
                    hits: items.length > 1 ? items[1].hits : 0,
                  ),
                  Gaps.v10,
                  PopularNoticeItem(
                    rank: "3",
                    body: items.length > 2 ? items[2].body : "-",
                    hits: items.length > 2 ? items[2].hits : 0,
                  ),
                  Gaps.v10,
                  PopularNoticeItem(
                    rank: "4",
                    body: items.length > 3 ? items[3].body : "-",
                    hits: items.length > 3 ? items[3].hits : 0,
                  ),
                  Gaps.v10,
                  PopularNoticeItem(
                    rank: "5",
                    body: items.length > 4 ? items[4].body : "-",
                    hits: items.length > 4 ? items[4].hits : 0,
                  ),
                ],
              ),
            ),
            if (isLoading == true)
              const PopularNoticeContainer(
                child: Center(
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            if (isLoading != true && items.isEmpty)
              const PopularNoticeContainer(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "🧐",
                        style: TextStyle(fontSize: 35),
                      ),
                      Text("아직 데이터를 분석 중이에요!"),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class PopularNoticeContainer extends StatelessWidget {
  const PopularNoticeContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Container(
      width: double.infinity,
      height: 176.0,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: isDark ? const Color.fromARGB(255, 53, 53, 53) : Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: child,
    );
  }
}
