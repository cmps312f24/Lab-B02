int add(int a, int b) {
  return a + b;
}

// function with optional parameters
// and positional parameters
int addOptional(int a, [int b = 10]) {
  return a + b;
}

// named parameters functions
int addName({required int a, int b = 90}) {
  return a + b;
}

void main(List<String> args) {
  print(add(10, 20));
  print(addOptional(10));
  print(addOptional(10, 60));

  print(addName(a: 10));
  print(addName(a: 10, b: 60));
  print(addName(b: 10, a: 60));
}
