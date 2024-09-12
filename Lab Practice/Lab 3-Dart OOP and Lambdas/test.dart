import 'model/a.dart';
import 'model/b.dart';
import 'model/c.dart';
import 'dart:io';
import 'dart:convert';

void main(List<String> args) {
  // List<C> list = [A(name: "Abdulahi"), B(), C()];
  // list.add(A(name: "Ali"));
  // list.add(B());
  // list.add(C());

  // for (var i in list) {
  //   print(i);
  // }

  // read from a file
  var file = File('data/covid-data.json');

  // convert the file to a string
  var jsonString = file.readAsStringSync();

  // convert this into a Map
  var countriesMap = jsonDecode(jsonString);

  var json = countriesMap[0];
  print(json);
  print(json['country']);

  // for (var country in countriesMap) {
  //   print(country['country']);
  // }

  // print(jsonString);
}
