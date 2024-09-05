int add(int accumulator, int currentValue) {
  print('accumulator: $accumulator, currentValue: $currentValue');
  return accumulator + currentValue;
}

void main(List<String> args) {
  List<int> numbers = [1, 2, 3, 4, 5, 6];

  print(numbers);

  // for (var number in numbers) {
  //   print(number);
  // }

  // numbers.forEach((name) => print(name));
  var squaredNumbers = numbers.map((a) => a * a).reduce(add);
  // print(squaredNumbers);

  var sum = numbers.fold(0, (add));

  var max = numbers.reduce((a, b) => a > b ? a : b);
  print('Sum is $sum');
}
