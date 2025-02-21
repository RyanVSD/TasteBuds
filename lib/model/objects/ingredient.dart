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

  @override
  String toString() {
    String strbuilder = "";
    double value = _unit.getValue();
    String formatValue =
        value % 1 == 0 ? value.toInt().toString() : value.toString();
    if (value == 0) {
      return _name;
    }
    strbuilder += formatValue;
    strbuilder += " ";
    if (_unit.getType() != UnitType.none) {
      strbuilder += _unit.getType().name;
      if (value != 1) strbuilder += "s";
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
