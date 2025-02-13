enum CampusType {
  yongbong,
  hwasun,
  yeosu,
  ;

  factory CampusType.getByString(String typeName) {
    return CampusType.values.firstWhere((value) => value.name == typeName);
  }
}
