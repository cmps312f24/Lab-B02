class Car {
  String name;
  String color;

  // Car(String name, String color) {
  //   this.name = name;
  //   this.color = color;
  // }
  Car(this.name, this.color);

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

void main(List<String> args) {
  Car car = Car('Toyota', 'Red');
  print(car);
  int age = 20;
  int x;
  if (age > 20) x = 10;

  // create a list of integers
  List<int> numbers = [1, 2, 3, 4, 5, 6];
}

// add extention to the L
