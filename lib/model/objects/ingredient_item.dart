enum UnitType {
  none,
  teaspoon,
  tablespoon,
  cup,
  pint,
  quart,
  gallon,
  fluidOunce,
  milliliter,
  liter,
  decalitre,
  gill,
  gram,
  kilogram,
  ounce,
  pound,
}

// Unit valuaes
const Map<UnitType, double> conversionToBase = {
  // milliliter base for volume
  UnitType.teaspoon: 4.92892,
  UnitType.tablespoon: 14.7868,
  UnitType.cup: 240.0,
  UnitType.pint: 473.176,
  UnitType.quart: 946.353,
  UnitType.gallon: 3785.41,
  UnitType.fluidOunce: 29.5735,
  UnitType.liter: 1000.0,
  UnitType.milliliter: 1.0,
  UnitType.decalitre: 10000.0,
  UnitType.gill: 118.294,

  // Gram base for weight
  UnitType.gram: 1.0,
  UnitType.kilogram: 1000.0,
  UnitType.ounce: 28.3495,
  UnitType.pound: 453.592,

  // None is its own base
  UnitType.none: 1.0,
};

enum UnitClass {
  none,
  volume,
  mass,
}

class IngredientItem {
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

  static const _decCount = 3;
  // Private member variables
  final String _name;
  UnitType _unit;
  double _value;
  late UnitClass _class;

  UnitClass _getClass(UnitType t) {
    switch (t) {
      case UnitType.gram:
      case UnitType.kilogram:
      case UnitType.ounce:
      case UnitType.pound:
        return UnitClass.mass;

      case UnitType.none:
        return UnitClass.none;

      default:
        return UnitClass.volume;
    }
  }

  // Constructor for when you use enum
  IngredientItem.withUnitType(
      {required String name, required UnitType unit, required value})
      : _name = name,
        _unit = unit,
        _value = value {
    _class = _getClass(_unit);
  }

  // Constructor for giving unit
  IngredientItem(
      {required String name, required String unit, required double value})
      : _name = name,
        _unit = UnitType.values.firstWhere((e) => e.name == unit,
            orElse: () => throw ArgumentError('Invalid unit type: $unit')),
        _value = value {
    _class = _getClass(_unit);
  }

  // Constructor for when there is no unit
  IngredientItem.noUnit({required String name, required double value})
      : _name = name,
        _unit = UnitType.none,
        _value = value {
    _class = _getClass(_unit);
  }

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
    if (!isCookingFrac) {
      format += nonDec > 0
          ? IngredientItem.trimToNSignificantDecimals(
                  dec, IngredientItem._decCount)
              .substring(1)
          : IngredientItem.trimToNSignificantDecimals(
              dec, IngredientItem._decCount);
    }

    return format;
  }

  // Given a positive decimal float (0 <= decimal < 1), trim it to only N decimal nums
  // (0.12345, 3) --> "0.123"
  // (0.00012345, 3) --> "0.000123"
  static String trimToNSignificantDecimals(double decimal, int n) {
    String str = decimal.toString();
    if (decimal > 1) throw ArgumentError("decimal must be < 1");
    RegExp regex = RegExp(r'(0\.0{0,}[1-9]\d{0,2})(.*)');
    Match? match = regex.firstMatch(str);
    if (match != null) {
      String ret = match.group(1)!;
      return ret;
    } else {
      return "0";
    }
  }

  // Prints the ingredient in the form of
  // ({number}) (of {unit}(s)) {name}
  // If number is 0, omit. Prints in mixed number form if cooking fraction, see _formatValue()
  // If unit is none or number is 0, omit. If number > 1, plural unit
  // Name always printed
  @override
  String toString() {
    String strbuilder = "";
    String formatValue = IngredientItem._formatValue(_value);

    if (_value == 0) {
      return _name;
    }
    strbuilder += formatValue;
    strbuilder += " ";
    if (_unit != UnitType.none) {
      if (_unit == UnitType.fluidOunce) {
        strbuilder += "fluid ounce";
      } else {
        strbuilder += _unit.name;
      }
      if (_value > 1) strbuilder += "s";
      strbuilder += " of ";
    }
    strbuilder += _name;
    return strbuilder;
  }

  factory IngredientItem.fromJson(Map<String, dynamic> json) {
    return IngredientItem(
        name: json['name'], unit: json['unit'], value: json['value']);
  }

  void convertTo(UnitType newUnit) {
    if (_value == 0) throw Exception("Value not defined");
    if (_class != _getClass(newUnit)) {
      throw Exception(
          "Cannot convert between: ${_class.name} and ${_getClass(newUnit).name}");
    }
    if (newUnit == _unit || newUnit == UnitType.none) return;
    double valueInBase = _value * conversionToBase[_unit]!;
    _value = valueInBase / conversionToBase[newUnit]!;
    _unit = newUnit;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'unit': _unit.name,
      'value': _value,
    };
  }

  String getUnitType() {
    return _unit.name;
  }

  String getName() {
    return _name;
  }

  double getValue() {
    return _value;
  }

  String getUnitClass() {
    return _class.name;
  }
}
