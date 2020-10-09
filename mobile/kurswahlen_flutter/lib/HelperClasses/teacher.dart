class Teacher {
  String _name;
  String _shortName;
  String _subject;

  Teacher(String name, String shortName, String subject) {
    this._name = name;
    this._shortName = shortName;
    this._subject = subject;
  }

  get name => this._name;
  get shortName => this._shortName;
  get subject => this._subject;
}
