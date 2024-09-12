// 1. How to create classes
// 2. How to create constructors [default, named, and factory]
// 3. How to create methods [instance, static, and getter/setter]
// 4. Inheritance
// 5. mixins
// 6. abstract classes
// 7. interfaces
// 8. Polymorphism
abstract class Animal {
  late String _name;
  late int _age;

  // Animal({name, age}) {
  //   this._name = name;
  //   this._age = age;
  // }
  // Animal.namedConstructor(this._name, this._age);

  Animal({name, age})
      : this._name = name,
        this._age = age;
  // Animal(this._name, this._age);

  set name(String name) {
    if (name.length >= 2) {
      _name = name;
    } else {
      throw ('Name must be at least 2 characters');
    }
  }

  String get name => _name;

  set age(int age) => this._age = age;
  int get age => _age;

  void makeSound();
}

class Lion extends Animal with Jumpable {
  late int _prideSize;

  Lion({name, age, prideSize}) : super(name: name, age: age) {
    this.prideSize = prideSize;
  }
  set prideSize(int prideSize) => this._prideSize = prideSize;
  int get prideSize => _prideSize;

  void makeSound() {
    print('Roar');
  }

  factory Lion.fromJson(Map<String, dymanic> json) {
    return Lion(
        name: json['name'], age: json['age'], prideSize: json['prideSize']);
  }
}

mixin Jumpable {
  void jump() {
    print('Jumping ...');
  }
}
mixin Swimmable {
  void Swim() {
    print('Swimming ...');
  }
}

class Human extends Animal with Jumpable, Swimmable {
  late String _job;

  Human({name, age, job}) : super(name: name, age: age) {
    this.job = job;
  }

  set job(String job) => this._job = job;
  String get job => this._job;

  @override
  void makeSound() {
    print('Hello');
  }
}

void main(List<String> args) {
  Animal human = Human(name: 'John', age: 30, job: 'Software Engineer');
  Animal lion = Lion(name: 'Simba', age: 5, prideSize: 15);

  List<Animal> animals = [human, lion, animal];

  for (Animal animal in animals) {
    animal.makeSound();

    var json = {'name': 'Simba', 'age': 5, 'prideSize': 15};
    var cub = Lion.fromJson(json);
  }
}
