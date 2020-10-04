class Subject {
  String _name;
  String _room;
  String _teacher;

  Subject(String name, String room, String teacher) {
    this._name = name;
    this._room = room;
    this._teacher = teacher;
  }

  String getName() { return this._name; }
  String getRoom() { return this._room; }
  String getTeacher() { return this._teacher; }
}
