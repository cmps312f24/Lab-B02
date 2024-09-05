void main(List<String> args) {
  print('Welcome to Dart Programming');

  //variables and data types
  int? age;
  double pi = 3.14;
  String name = 'John Doe';
  bool isTrue = true;

  print(age);

  // two special ones
  var x = "this is a string"; // x is an integer
  dynamic y = 20; // y can be anything

  // x = 10; // this will throw an error
  // y = "a string value"; // this will not throw an error

  var weird;
  weird = 10;
  weird = "a string value";

  print(weird);

  print(y);

  // String interpolation
  print('the value of y is' + y.toString());
  print('the value of y is ${y > 10 ? 'greater than 10' : 'less than 10'}');

  // more data types
// Lists
  List<int> numbers = [1, 2, 3, 4, 5];
  List<dynamic> dynamicNumbers = [1, 2, 3, 4, 5, "Hello", "Whatever"];

  print(numbers);
  print(dynamicNumbers);

  for (var number in numbers) {
    print(number);
  }

  // Maps

  Map<String, dynamic> user = {
    'name': 'John Doe',
    'email': 'john@jo.com',
    'age': 20,
    'isVerified': true,
    'hobbies': ['reading', 'coding', 'traveling']
  };

  // display the map values
  print(user['name']);

  // display the map keys

  // set

  Set<dynamic> dynamicSet = {1, 2, 3, 4, 5, '1'};
  Set<int> dynamicSet2 = {1, 2, 3, 4, 5};

  // const and final

  final int word;
  word = 20;
  print(word);

  const int word2 = 55;
  print(word2);
}
