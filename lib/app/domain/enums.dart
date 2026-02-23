enum CategoryEnum {
  food,
  transport,
  services,
  others;

  static CategoryEnum fromString(String value) {
    return CategoryEnum.values.firstWhere(
      (e) => e.name == value.toLowerCase(),
      orElse: () => CategoryEnum.others,
    );
  }
}

enum CurrencyEnum {
  pen,
  usd,
  eur;

  static CurrencyEnum fromString(String value) {
    return CurrencyEnum.values.firstWhere(
      (e) => e.name == value.toLowerCase(),
      orElse: () => CurrencyEnum.pen,
    );
  }
}