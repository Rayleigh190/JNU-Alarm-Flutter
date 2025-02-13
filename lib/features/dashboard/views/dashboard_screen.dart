import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jnu_alarm/common/utils.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/constants/sizes.dart';
import 'package:jnu_alarm/features/dashboard/view_models/dashboard_view_model.dart';
import 'package:jnu_alarm/features/dashboard/views/widgets/dashboard_main_button.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(dashboardProvider.notifier).refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardProvider);

    final isDark = isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size16,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Gaps.v24,
              const Center(
                child: Text(
                  "${00}월 ${00}일 (월)",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                  ),
                ),
              ),
              Gaps.v16,
              dashboardState.when(
                data: (data) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.network(
                      width: 60,
                      data.weather.imageUrl,
                      placeholderBuilder: (context) => const SizedBox(
                        width: 60,
                        height: 60,
                      ),
                    ),
                    Gaps.h6,
                    Text(
                      "${data.weather.temperature}°C",
                      style: const TextStyle(
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                    ),
                  ],
                ),
                loading: () => const SizedBox(
                  height: 60,
                ),
                error: (err, stack) => SizedBox(
                  height: 60,
                  child: Center(child: Text('Error: $err')),
                ),
              ),
              Gaps.h10,
              Container(
                padding: const EdgeInsets.fromLTRB(5, 4, 11, 3),
                decoration: const BoxDecoration(
                  color: Color(0xFF323430),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      Sizes.size56,
                    ),
                  ),
                ),
                child: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        child: Text('용봉캠'),
                      ),
                      const PopupMenuItem(
                        child: Text('여수캠'),
                      ),
                      const PopupMenuItem(
                        child: Text('화순캠'),
                      ),
                    ];
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: Colors.white70,
                        size: Sizes.size20,
                      ),
                      Gaps.h1,
                      Text(
                        "광주캠",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gaps.v36,
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DashboardMainButton(
                    title: "학사일정",
                    emoji: '🗓️',
                  ),
                  Gaps.h16,
                  DashboardMainButton(
                    title: "학식메뉴",
                    emoji: '🍱',
                  ),
                  Gaps.h16,
                  DashboardMainButton(
                    title: "긱식메뉴",
                    emoji: '🍽️',
                  ),
                ],
              ),
              Gaps.v20,
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF282828) : Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Sizes.size12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 1.0,
                      spreadRadius: 1,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
