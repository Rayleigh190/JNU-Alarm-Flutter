import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/dashboard/view_models/map_top_category_view_model.dart';
import 'package:jnu_alarm/features/dashboard/views/widgets/map_bottom_sheet.dart';
import 'package:jnu_alarm/features/dashboard/views/widgets/map_top_category_button.dart';

class MapScreen extends ConsumerStatefulWidget {
  static const routeName = "/map";
  const MapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController?
      bottomSheetController; // BottomSheetController 저장

  @override
  Widget build(BuildContext context) {
    final topCategoryAsync = ref.watch(topCategoryProvider);

    return Scaffold(
      key: scaffoldState,
      body: Stack(
        children: [
          NaverMap(
            options: const NaverMapViewOptions(
              initialCameraPosition: NCameraPosition(
                target: NLatLng(35.1755091, 126.9071166),
                zoom: 14,
              ),
              extent: NLatLngBounds(
                southWest: NLatLng(35.17, 126.90),
                northEast: NLatLng(35.18, 126.91),
              ),
            ),
            onMapReady: (controller) async {
              final marker = NMarker(
                  id: "test",
                  icon: await NOverlayImage.fromWidget(
                    widget: const Text(
                      "🏫",
                      style: TextStyle(fontSize: 30),
                    ),
                    size: const Size(30, 36),
                    context: context,
                  ),
                  position:
                      const NLatLng(35.178359596721634, 126.9093914649144),
                  caption: const NOverlayCaption(text: "대학본부"));
              marker.setOnTapListener(
                (NMarker marker) {
                  bottomSheetController =
                      scaffoldState.currentState?.showBottomSheet(
                    (context) => DraggableScrollableSheet(
                      maxChildSize: 0.95,
                      initialChildSize: 0.4,
                      minChildSize: 0.4,
                      expand: false,
                      snap: true,
                      snapSizes: const [0.4, 0.95],
                      shouldCloseOnMinExtent: false,
                      builder: (context, scrollController) => MapBottomSheet(
                        scrollController: scrollController,
                      ),
                    ),
                  );

                  bottomSheetController?.closed.then((_) {
                    bottomSheetController =
                        null; // BottomSheet 닫히면 controller 제거
                  });
                },
              );
              controller.addOverlayAll({marker});
              controller.setLocationTrackingMode(NLocationTrackingMode.follow);
            },
            onMapTapped: (point, latLng) {
              if (bottomSheetController != null) {
                bottomSheetController?.close(); // BottomSheet가 있으면 닫기
              }
            },
            onSymbolTapped: (symbolInfo) {
              if (bottomSheetController != null) {
                bottomSheetController?.close(); // BottomSheet가 있으면 닫기
              }
            },
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      minWidth: 0,
                      onPressed: () => Navigator.of(context).pop(),
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                      ),
                    ),
                    MaterialButton(
                      minWidth: 0,
                      onPressed: () {},
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(right: 8, top: 6, bottom: 6),
                  scrollDirection: Axis.horizontal,
                  child: topCategoryAsync.maybeWhen(
                    data: (categories) => Row(
                      children: categories.map(
                        (category) {
                          return MapTopCategoryButton(name: category.name);
                        },
                      ).toList(),
                    ),
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
