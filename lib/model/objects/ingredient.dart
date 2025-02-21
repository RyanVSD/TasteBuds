import 'package:tastebuds/model/objects/unit.dart';

class Ingredient {
  final String name;
  final Unit unit;
  Ingredient({required this.name, required this.unit});

  @override
  String toString() {
    String strbuilder = "";
    strbuilder += unit.getValue().toString();
    strbuilder += " ";
    if (unit.getType() != UnitType.none) {
      strbuilder += unit.getType().name;
      if (unit.getValue() > 1) {
        strbuilder += "s";
      }
      strbuilder += " of ";
    }
    strbuilder += name;
    return strbuilder;
  }

  void convertTo(UnitType newUnit) {
    unit.convertTo(newUnit);
  }
}
