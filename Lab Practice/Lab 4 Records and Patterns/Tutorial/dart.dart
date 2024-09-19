class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
}

void main(List<String> args) {
  List<Person> persons = [
    Person(name: 'John Doe', age: 30),
    Person(name: 'Jane Doe', age: 25),
    Person(name: 'James Doe', age: 40),
  ];

  var person = persons.firstWhere((element) => element.age == 666, orElse: () {
    return Person(name: 'No Name', age: 0);
  });
  print(person.name);

//
  // find number 77
  // var number = numbers.firstWhere((element) => element == 100);

  // handle the exception
  // var number =
  //     numbers.firstWhere((element) => element == 100, orElse: () => -1);

  // print(number);
}
