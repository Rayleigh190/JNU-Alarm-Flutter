import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jnu_alarm/common/widgets/common_web_view_screen.dart';
import 'package:jnu_alarm/common/widgets/notice_web_view_screen.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/dashboard/models/map_model.dart';
import 'package:jnu_alarm/features/dashboard/view_models/map_top_category_view_model.dart';
import 'package:jnu_alarm/features/dashboard/views/widgets/map_bottom_sheet.dart';
import 'package:jnu_alarm/features/dashboard/views/widgets/map_top_category_button.dart';
import 'package:url_launcher/url_launcher.dart';

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
  NaverMapController? naverMapController;

  @override
  void dispose() {
    naverMapController?.dispose();
    super.dispose();
  }

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
                target: NLatLng(35.17773883237159, 126.90795676604174),
                zoom: 14,
              ),
              extent: NLatLngBounds(
                southWest: NLatLng(35.17, 126.88),
                northEast: NLatLng(35.19, 126.92),
              ),
            ),
            onMapReady: (controller) async {
              naverMapController = controller;
              ref.read(topCategoryProvider.notifier).refreshCategory();
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: Row(
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
                        child: PopupMenuButton(
                          color: Colors.white,
                          onSelected: (value) async {
                            if (value == 0) {
                              Navigator.pushNamed(
                                  context, CommonWsebViewScreen.routeName,
                                  arguments: WebViewScreenArgs(
                                    title: "문의하기",
                                    link: "https://forms.gle/pXpf8qZV5f6pXvpo9",
                                  ));
                            } else if (value == 1) {
                              final url = Uri.parse(
                                  "https://open.kakao.com/o/sU2FdHih");
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.externalApplication);
                              }
                            }
                          },
                          itemBuilder: (context) {
                            return [
                              const PopupMenuItem(
                                value: 0,
                                child: Text(
                                  '전대지도 문의센터\n(장소등록,수정요청 등)',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 1,
                                child: Text(
                                  '장소 사진 등록\n(오픈카톡)',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ];
                          },
                          child: const Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 14, right: 6, bottom: 6),
                  scrollDirection: Axis.horizontal,
                  child: topCategoryAsync.maybeWhen(
                    data: (categories) => Row(
                      children: categories.map(
                        (category) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await naverMapController?.clearOverlays();
                                  final places = await ref
                                      .read(placesProvider.notifier)
                                      .fetchPlaces(category.url);
                                  if (naverMapController != null &&
                                      places.isNotEmpty) {
                                    setMarker(places, naverMapController!);
                                  }
                                },
                                child:
                                    MapTopCategoryButton(name: category.name),
                              ),
                              Gaps.h8,
                            ],
                          );
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

  Future<void> setMarker(
      List<PlaceModel> data, NaverMapController controller) async {
    final markers = data.map((place) async {
      final marker = NMarker(
          id: place.title,
          icon: await NOverlayImage.fromWidget(
            widget: Text(
              place.emoji,
              style: const TextStyle(fontSize: 30),
            ),
            size: const Size(36, 36),
            context: context,
          ),
          position: NLatLng(place.coord.lat, place.coord.lng),
          caption: NOverlayCaption(text: place.title));
      marker.setOnTapListener(
        (NMarker marker) {
          bottomSheetController = scaffoldState.currentState?.showBottomSheet(
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
                place: place,
              ),
            ),
          );

          bottomSheetController?.closed.then((_) {
            bottomSheetController = null; // BottomSheet 닫히면 controller 제거
          });
        },
      );
      return marker;
    }).toList();

    for (var marker in markers) {
      controller.addOverlay(await marker);
    }
  }
}
