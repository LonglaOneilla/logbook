class Field{
  String _C_id="";
  String _className="";

  Field.name(this._C_id, this._className);

  Field();

  String get className => _className;

  set className(String value) {
    _className = value;
  }

  String get C_id => _C_id;

  set C_id(String value) {
    _C_id = value;
  }
}