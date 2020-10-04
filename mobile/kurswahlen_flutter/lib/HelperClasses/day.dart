import 'package:kurswahlenflutter/HelperClasses/subject.dart';

class Day {
  String _name;
  List<Subject> _classes;

  Day(String name, List<Subject> classes) {
    this._classes = classes;
    this._name = name;
  }

  String getName() {
    return this._name;
  }

  List<Subject> getClasses() {
    return this._classes;
  }
}
