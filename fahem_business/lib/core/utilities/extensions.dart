import 'package:fahem_business/data/data_source/static/countries_data.dart';
import 'package:fahem_business/data/data_source/static/currencies_data.dart';
import 'package:fahem_business/data/models/static/country_model.dart';
import 'package:fahem_business/data/models/static/currency_model.dart';

extension StringExtension on String {

  String toCapitalized() {
    return length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  }

  String toTitleCase() {
    return replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
  }

  CountryModel getCountryModelFromCountryId() {
    return countriesData.firstWhere((element) => element.countryId == this);
  }

  CountryModel getCountryModelFromDialingCode() {
    return countriesData.firstWhere((element) => element.dialingCode == this);
  }

  CurrencyModel getCurrencyModelFromCurrencyId() {
    return currenciesData.firstWhere((element) => element.currencyId == this);
  }
}