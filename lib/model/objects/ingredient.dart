import 'package:tastebuds/model/objects/unit.dart';

class Ingredient {
  // Private member variables
  final String _name;
  final Unit _unit;

  // Constructor
  Ingredient({required String name, required Unit unit})
      : _name = name,
        _unit = unit;

  @override
  String toString() {
    String strbuilder = "";
    strbuilder += _unit.getValue().toString();
    strbuilder += " ";
    if (_unit.getType() != UnitType.none) {
      strbuilder += _unit.getType().name;
      if (_unit.getValue() > 1) {
        strbuilder += "s";
      }
      strbuilder += " of ";
    }
    strbuilder += _name;
    return strbuilder;
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
