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
}
