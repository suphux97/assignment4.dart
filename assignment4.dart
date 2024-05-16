import 'dart:io';

// Define an interface
abstract class Animal {
  void speak();
}

// Define a base class
class Mammal implements Animal {
  String name;
  int age;

  Mammal(this.name, this.age);

  @override
  void speak() {
    print('$name makes a sound');
  }
}

// Define a subclass that inherits from Mammal
class Dog extends Mammal {
  Dog(String name, int age) : super(name, age);

  @override
  void speak() {
    print('$name barks');
  }
}

// Define a class that reads data from a file and initializes instances
class FileReader {
  List<Mammal> readDataFromFile(String filePath) {
    List<Mammal> mammals = [];
    File file = File(filePath);
    List<String> lines = file.readAsLinesSync();

    for (String line in lines) {
      List<String> parts = line.split(',');
      String name = parts[0];
      int age = int.parse(parts[1]);
      mammals.add(Dog(name, age)); // Assume all data in the file represents dogs
    }

    return mammals;
  }
}

void main() {
  // Initialize FileReader
  FileReader reader = FileReader();

  // Read data from file and initialize instances
  List<Mammal> mammals = reader.readDataFromFile('data.txt');

  // Demonstrate the use of a loop
  for (Mammal mammal in mammals) {
    mammal.speak();
  }
}
