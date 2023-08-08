class User {
  String? name;
  int? age;

  User(this.name, this.age);

  User.one() {}

  User.two(String name) : this(name, 0);
}
class Singleton{
  Singleton._privateConstructor(); // 생성자. _가 추가되면 private
  static final Singleton _instance = Singleton._privateConstructor();
  factory Singleton() => _instance;
}
main() {
  User user1 =User("kmi",20);
  User user2 = User.one();
  User user3 = User.two("i");
  print(user3.name);
}
