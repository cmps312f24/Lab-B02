void main(List<String> args) {
  int age = 20;

  if (age > 18)
    print('You are an adult');
  else if (age == 18)
    print('You are a teenager');
  else
    print('You are a minor');

  // Ternary operator

  var value = age > 18 ? ('You are an adult') : ('You are a minor');

  // switch case
  int grade = 85;

  String letterGrade = switch (grade) {
    > 90 && < 100 => 'A',
    > 80 && < 90 => 'B',
    > 70 && < 80 => 'C',
    _ => 'D'
  };
  print(letterGrade);
}
