class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;
  Note(this._title, this._date, this._priority, [this._description]);
  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description]);
  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  set title(String newenter) {
    if (newenter.length <= 255) {
      this._title = newenter;
    }
  }

  set description(String newenter) {
    if (newenter.length <= 2000) {
      this._description = newenter;
    }
  }

  set priority(int newenter) {
    if (newenter >= 1 && newenter <= 2) {
      this._priority = newenter;
    }
  }

  set date(String newenter) {
    this._date = newenter;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}
