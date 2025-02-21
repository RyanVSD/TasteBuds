import 'dart:convert';

import 'package:tastebuds/model/objects/unit.dart';

class Ingredient {
  // IF ADDING TO COOKING FRACTIONS KEEP ASCENDING ORDER
  static const List<double> cookingFractions = [
    1 / 2,
    1 / 3,
    1 / 4,
    1 / 5,
    1 / 6,
    1 / 8,
    1 / 9,
    1 / 10,
    1 / 12,
    1 / 16,
    1 / 20,
    1 / 32
  ];
  // Private member variables
  final String _name;
  final Unit _unit;

  // Constructor for when you have unit class already
  Ingredient.withUnitClass({required String name, required Unit unit})
      : _name = name,
        _unit = unit;

  // Constructor for giving unit
  Ingredient(
      {required String name, required String unit, required double value})
      : _name = name,
        _unit = Unit.stringType(type: unit, value: value);

  // Constructor for when there is no unit
  Ingredient.noUnit({required String name, required double value})
      : _name = name,
        _unit = Unit.stringType(type: "none", value: value);

  // Gets the format of value for ingredient
  // If cooking fraction (1/8, 3/4, 1/2, etc) print in mixed form
  // Else print in decimal form
  // 5.75 -> "5 3/4"
  // 10.56 -> "10.56"
  // 0.14 -> "0.14"
  // 0.50 -> "1/2"
  // 999.875 -> "999 7/8"
  static String _formatValue(double value) {
    String format = "";
    int nonDec = value.truncate();
    double dec = value - nonDec;
    if (dec == 0) return nonDec.toString();
    if (nonDec > 0) format += "$nonDec";

    // Check cooking fraction
    bool isCookingFrac = false;
    for (double frac in cookingFractions) {
      // Use epsilon method to check how close since modulo doesnt work
      // See 0.6 % 0.2, it does not equal 0. Instead 0.1999999996.
      // Causes 0.6 to not be recognized as 3/5, so use this method instead
      // What this does is check if within
      if (((dec / frac) - (dec / frac).round()).abs() <= 1e-9) {
        // (dec/frac)
        format +=
            "${nonDec <= 0 ? "" : " "}${(dec / frac).round()}/${(1 / frac).round()}";
        isCookingFrac = true;
        break;
      }
    }
    if (!isCookingFrac && dec != 0) {
      format += nonDec > 0
          ? dec.toStringAsFixed(2).substring(1)
          : dec.toStringAsFixed(2);
    }

    return format;
  }

  // Prints the ingredient in the form of
  // ({number}) (of {unit}(s)) {name}
  // If number is 0, omit. Prints in mixed number form if cooking fraction, see _formatValue()
  // If unit is none or number is 0, omit. If number > 1, plural unit
  // Name always printed
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
    return Ingredient.withUnitClass(
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
