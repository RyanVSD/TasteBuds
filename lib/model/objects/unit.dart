// Enum for all units
// None represents no unit type. Purpose is for count (2 apples, 4 garlic cloves)
enum UnitType {
  none,
  teaspoon,
  tablespoon,
  cup,
  pint,
  quart,
  gallon,
  fluidOunce,
  mililiter,
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
  // Mililiter base for volume
  UnitType.teaspoon: 4.92892,
  UnitType.tablespoon: 14.7868,
  UnitType.cup: 240.0,
  UnitType.pint: 473.176,
  UnitType.quart: 946.353,
  UnitType.gallon: 3785.41,
  UnitType.fluidOunce: 29.5735,
  UnitType.liter: 1000.0,
  UnitType.mililiter: 1.0,
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

// Enum for unit class, aka volume or mass
enum UnitClass {
  none,
  volume,
  mass,
}

/* 
  Class used to represent a unit
  Supports translation between units
*/
class Unit {
  UnitType mType;
  double mValue;
  late UnitClass mClass;

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

  Unit({required this.mType, required this.mValue}) {
    mClass = _getClass(mType);
  }

  void convertTo(UnitType newUnit) {
    if (mValue == 0) throw Exception("Value not defined");
    if (mClass != _getClass(newUnit)) {
      throw Exception(
          "Cannot convert between: ${mClass.name} and ${_getClass(newUnit).name}");
    }
    if (newUnit == mType || newUnit == UnitType.none) return;
    double valueInBase = mValue * conversionToBase[mType]!;
    mValue = valueInBase / conversionToBase[newUnit]!;
    mType = newUnit;
  }
}
