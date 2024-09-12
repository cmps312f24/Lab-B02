extension on List {
  void printElements() {
    for (var i in this) {
      print(i);
    }
  }

  int sum() {
    return this.reduce((a, b) => a + b);
  }
}

extension on String {
  String firstChar() {
    return this[0];
  }
}

void main(List<String> args) {
  List<int> numbers = [1, 2, 3, 4, 5];
  List<int> numbers2 = [11, 21, 31, 41, 51];
  List<String> names = ['John', 'Doe', 'Smith'];
  // names.printElements();

  print('The first character of  ${names[0]}  is ${names[0].firstChar()}');

  // numbers.printElements();
  // numbers2.printElements();
  // print('The sum of the numbers is ${numbers.sum()}');
  // print('The sum of the numbers is ${numbers2.sum()}');
}
