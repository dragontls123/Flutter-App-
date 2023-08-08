main() {
  // type은 모두다 객체이다. NULL SAFETY를 지원한다.
  // NULL에 의한 NPE를 누가 신경써야 하는가?
  // NULL SAFETY는 타입이야기다. NULLable, non-null
  // 기본은 non-null로 선언하고, null 대입 가능성이 있는 변수에 한해 nullable로 선언!
  // nullable로 선언한 변수를 이용할 때는 null safety operator를 이용해주어야함 : ?.


  int data1 = 10;
  bool? data2;
  double? data3;

  data2 = true;
  data3 = null;

  data1.isEven; //객체임으로 int 클래스의 멤버 이용 가능

  // data3=data1; // error.. 모두 객체임으로 int - double 캐스팅이 안된다.
  data3 = data1.toDouble(); // 함수를 이용해서 캐스팅
  int data4 = data3.toInt();

  // String - int
  String data5 = '10';
  int data6 = int.parse(data5);
  String data7 = data6.toString();

  //
  int a = 10;
  // a='hello';//error

  //var은 타입이 없다는 의미가 아니라 타입 유추기법이다. 선언하는 라인의 대입값에 의해 타입이 고정된다.
  var b = 10;
  // b='hello'; //error

  // 모든 타입의 데이터가 다 대입되는 타입. 일종의 ANY
  dynamic c = 10;
  c = 'hello';

  // var로 변수를 선언하면서 값을 대입하지 않으면 타입 유추가 안된다.
  var d;
  d = 10;
  d = true;

  // 배열이 List 이고 List가 배열이다.
  // 사이즈 고정하지 않고 사용하고자 할 때
  // List 초기화를 []로 하면 사이즈 고정이 되지 않는다.
  List<int> list1 = [10, 20, 30];
  list1[0] = 30;
  list1.add(50);
  list1.forEach((element) {
    print(element);
  });

  // 사이즈를 고정해서 사용하고 싶을 때
  // List클래스의 생성자로 초기화 해야한다.

  // dart에서는 객체 생성시, new 사용해도 되고 생략해도 된다.
  // dart에서는 named constructor가 제공되어서 생성자를 개발자 임의 이름을 추가해서 함수처럼 선언 가능
  List<int?> list2 = List.filled(3, null);
  list2[0] = 10;
  list2.add(20);

  // 2차원 배열
  List<List<int>> list3 = [[1, 2], [3, 4, 5]];

  // map
  Map<String, String> map1 = {"One": "hello", "2": "world"}
  map1["one"];
}