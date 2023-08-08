class User {
  String? name;
  int? age;

  User(this.name, this.age);

  User.one() {}

  User.two(String name) : this(name, 0);
}

class Singleton {
  int data = 0;

  Singleton._privateConstructor(); // 생성자. _가 추가되면 private
  static final Singleton _instance = Singleton._privateConstructor();

  factory Singleton() => _instance;
}

//interface
class MyClass {
  int no = 0;
  String name = "kim";

  MyClass(this.no, this.name);

  String sayHello(String who) {
    return "Hello $who";
  }
}

class A extends MyClass {
  A(no, name) : super(no, name);
}

class B implements MyClass {
  // implements 의 모든 변수 , 함수를 구현해야 한다. 생성자는 제외.
  @override
  int no = 10;

  @override
  String get name => "lee";

  @override
  void set name(String name) {}

  @override
  String sayHello(String who) {
    // TODO: implement sayHello
    return "";
  }
}

//mixin
class Super {}

mixin MyMixin on Super {
  int mixinData = 10;

  void mixinFun() {}
}

class C extends Super with MyMixin {
  void some() {
    mixinData = 20;
    mixinFun();
  }
}

main() {
  User user1 = User("kmi", 20);
  User user2 = User.one();
  User user3 = User.two("i");
  // print(user3.name);

  Singleton obj1 = Singleton();
  Singleton obj2 = Singleton();

  obj1.data = 10;
  obj2.data = 20;

  print("${obj1.data}, ${obj2.data}"); //20, 20
}
