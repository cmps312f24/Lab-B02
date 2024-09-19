class Person {
  String name;
  int age;
  String email;

  Person({required this.name, required this.age, required this.email});
}

Person getNameAndAge(Map<String, dynamic> json) {
  return Person(name: json['name'], age: json['age'], email: json['email']);
}

({String name, int age, String email}) createPersonRecord(
    Map<String, dynamic> json) {
  return (name: json['name'], age: json['age'], email: json['email']);
}

void main(List<String> args) {
  // int a = 20;
  // int b = 40;

  Map<String, dynamic> json = {
    'name': 'John Doe',
    'age': 30,
    'email': 'john@yahoo.com'
  };

  var personRecord = createPersonRecord(json);
  print(personRecord.name);

  // var result = getNameAndAge(json);
  // print(result.name);
  // print(result.age);

  var (a, b) = (20, 40);
  print('a = $a, b = $b');

  (a, b) = (b, a);

  print('a = $a, b = $b');

  var numbers = [10, 50, 77];

  // var first = numbers[0];
  // var second = numbers[1];
  // var remaiing = numbers.sublist(2, numbers.length);

  var [first, ...last] = numbers;
  print('first $first,  last $last');
  // pattern matching
  var person = Person(name: 'John Doe', age: 30, email: 'a@a.com');

  // var n1 = person.name;
  // var a1 = person.age;
  // var e1 = person.email;

  var Person(name: String n1, age: int a1, email: String e1) = person;

  print('object destructuring: $n1, $a1, $e1');

  var json2 = {'name': 'John Doe', 'age': 30, 'email': 'a@a.com'};

  var {'name': n2, 'age': a2} = json2;
  print('object destructuring: $n2, $a2');


  switch (json2['age']) {
    case 20:
      print('20');
      break;
    case 30:
      print('30');
      break;
    default:
      print('default');
  }

  if(json2['age'] case 20){
    
  }
}
