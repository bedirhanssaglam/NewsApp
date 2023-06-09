enum NetworkEnums {
  topHeadlines('top-headlines'),
  everything('everything');

  final String endpointName;
  const NetworkEnums(this.endpointName);
}

enum CountryEnums {
  tr('tr'),
  us('us');

  final String countryCode;
  const CountryEnums(this.countryCode);
}
