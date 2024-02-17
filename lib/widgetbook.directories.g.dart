// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:credit_card_demo/credit_card.dart' as _i2;
import 'package:credit_card_demo/details_card.dart' as _i3;
import 'package:credit_card_demo/home_page.dart' as _i4;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookLeafComponent(
    name: 'CreditCard',
    useCase: _i1.WidgetbookUseCase(
      name: 'Default',
      builder: _i2.defaultCreditCard,
    ),
  ),
  _i1.WidgetbookLeafComponent(
    name: 'DetailsCard',
    useCase: _i1.WidgetbookUseCase(
      name: 'Default',
      builder: _i3.defaultDetailsCard,
    ),
  ),
  _i1.WidgetbookLeafComponent(
    name: 'HomePage',
    useCase: _i1.WidgetbookUseCase(
      name: 'Home Page',
      builder: _i4.homePage,
    ),
  ),
];
