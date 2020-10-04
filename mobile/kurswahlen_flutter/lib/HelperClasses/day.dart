class Day {
  String _name;
  List<String> _classes;

  Day(String name, List<String> classes) {
    this._classes = classes;
    this._name = name;
  }

  String getName() {
    return this._name;
  }

  List<String> getClasses() {
    return this._classes;
  }
}
