int add(int a, int b) {
  return a + b;
}

// (int a, int b) =>  a + b

var add2 = (a, b) => a + b;

// var display1 = () => print('Hello World');
// var display2 = () => print('Hello Qatar');
//  a function that takes a function

void myFunction(Function anotherFunction) {
  anotherFunction();
}

void myFunction2(Function(String) anotherFunction, String name) {
  anotherFunction(name);
}

void display(String name) {
  print(name);
}

// rewrite this functions using arrow functions
void main(List<String> args) {
  // myFunction(display1);
  myFunction(() => print('Hello World'));
  myFunction2(display, "Abdulahi");
  myFunction2((String name) => print(name), "Abdulahi");
  // print(add2(2, 5));

  // int x = 10;
  // int y = 20;

  // print(add2(x, y));
  // print(add2(10, 20));
}
