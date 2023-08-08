typedef MyFunctionType<T, A> = T Function(A arg);

class User {
  some() {}
}

main() {
  //optional
  //optional로 선언하면 외부에서 값 대입이 안될 수도 있다. 모든 것이 객체이기 때문에 대입안되면 null이다
  //optional로 선언한 매개변수는 nullable로 선언하거나 default 값을 명시해야 한다

  void namedOptional(bool data1, {String? data2, int data3 = 0}) {}
  namedOptional(true);
  namedOptional(true, data2: 'hello', data3: 10);
  namedOptional(true, data3: 10, data2: 'hello'); //순서변경가능

  void unnamedOptional(bool data1, [String? data2, int data3 = 0]) {}

  unnamedOptional(true);
  unnamedOptional(true, "hello");
  // unnamedOptional(true, data2:"hello"); //error
  // unnamedOptional(true, 10, "hello"); //error

  //function type
  int some(int no) {
    return no * 10;
  }

  void myFun1(Function argFun) {
    argFun();
  }

  myFun1(some);

  void myFun2(int Function(int a) argFun) {}
  myFun2(some);
  myFun2((int arg) => arg * 10);

  void myFun3(MyFunctionType<int, int> argFun){}
  myFun3(some);

  //null safety operator
  User? user =null;

  var a=user?.some() ?? "wolrd";






}
