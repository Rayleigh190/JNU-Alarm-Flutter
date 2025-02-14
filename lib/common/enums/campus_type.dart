enum CampusType {
  yongbong,
  hwasun,
  yeosu,
  ;

  factory CampusType.getByString(String typeName) {
    return CampusType.values.firstWhere((value) => value.name == typeName);
  }
}

extension CampusTypeExtension on CampusType {
  String get displayName {
    switch (this) {
      case CampusType.yongbong:
        return '광주캠';
      case CampusType.hwasun:
        return '화순캠';
      case CampusType.yeosu:
        return '여수캠';
    }
  }
}
