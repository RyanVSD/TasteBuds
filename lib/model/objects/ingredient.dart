import 'dart:convert';

import 'package:tastebuds/model/objects/unit.dart';

class Ingredient {
  // Private member variables
  final String _name;
  final Unit _unit;

  // Constructor
  Ingredient.withUnit({required String name, required Unit unit})
      : _name = name,
        _unit = unit;

  Ingredient(
      {required String name, required String unit, required double value})
      : _name = name,
        _unit = Unit.stringType(type: unit, value: value);

  Ingredient.noUnit({required String name, required double value})
      : _name = name,
        _unit = Unit.stringType(type: "none", value: value);

  static String _formatValue(double value) {
    String format = "";
    int nonDec = value.truncate();
    if (nonDec > 0) format += "$nonDec ";
    double dec = value - nonDec;
    switch (dec) {
      case 0.125:
        format += "1/8";
        break;
      case 0.25:
        format += "1/4";
        break;
      case 0.375:
        format += "3/8";
        break;
      case 0.5:
        format += "1/2";
        break;
      case 0.625:
        format += "5/8";
        break;
      case 0.75:
        format += "3/4";
        break;
      case 0.875:
        format += "7/8";
        break;
      default:
        if (dec != 0) {
          format += nonDec > 0
              ? dec.toStringAsFixed(2).substring(1)
              : dec.toStringAsFixed(2);
        }
    }
    return format;
  }

  @override
  String toString() {
    String strbuilder = "";
    double value = _unit.getValue();
    UnitType type = _unit.getType();
    String formatValue = Ingredient._formatValue(value);

    if (value == 0) {
      return _name;
    }
    strbuilder += formatValue;
    strbuilder += " ";
    if (_unit.getType() != UnitType.none) {
      if (type == UnitType.fluidOunce) {
        strbuilder += "fluid ounce";
      } else {
        strbuilder += type.name;
      }
      if (value > 1) strbuilder += "s";
      strbuilder += " of ";
    }
    strbuilder += _name;
    return strbuilder;
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient.withUnit(
        name: json['name'], unit: Unit.fromJson(jsonDecode(json['unit'])));
  }

  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'unit': jsonEncode(_unit),
    };
  }

  String getUnitType() {
    return _unit.getType().name;
  }

  String getName() {
    return _name;
  }

  double getValue() {
    return _unit.getValue();
  }

  String getUnitClass() {
    return _unit.getClass().name;
  }

  void convertTo(UnitType newUnit) {
    _unit.convertTo(newUnit);
  }
}
