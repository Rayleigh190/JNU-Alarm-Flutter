import 'package:flutter/material.dart';
import 'package:jnu_alarm/constants/gaps.dart';
import 'package:jnu_alarm/features/dashboard/models/map_model.dart';

class MapBottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final PlaceModel place;

  const MapBottomSheet({
    super.key,
    required this.scrollController,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: 30,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 18,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                place.title,
                                style: TextStyle(
                                  color: Colors.blue[800],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Gaps.h6,
                              Text(
                                place.category_name,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            place.description,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            place.image_url,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 100,
                                height: 100,
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
                              );
                            },
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 18,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    place.tag,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
