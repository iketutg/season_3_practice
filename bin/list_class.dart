class Person {
  final String _firstName;
  final String _lastName;
  final String _phone;
  Person(this._firstName, this._lastName, this._phone);
  @override
  toString() {
    return "$_firstName $_lastName $_phone";
  }
}

void main() {
  List<Person> list = [
    Person("Mark", "Clow", "4043124462"),
    Person("Brant", "Sandermine", "4243124462"),
    Person("Phillip", "Perry", "4243124444")
  ];
  print("Not sorted: $list");
  list.sort((a, b) => a._firstName.compareTo(b._firstName));
  print("Sorted by first name: $list");
  list.sort((a, b) => a._firstName.compareTo(b._lastName));
  print("Sorted by last name: $list");
}
