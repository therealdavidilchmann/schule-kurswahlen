class Subject {
  String _name;
  String _room;
  String _zeitraum;

  Subject(String name, String room, String zeitraum) {
    this._name = name;
    this._room = room;
    this._zeitraum = zeitraum;
  }

  String getName() { return this._name; }
  String getRoom() { return this._room; }
  String getZeitraum() { return this._zeitraum; }
}
