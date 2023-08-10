import 'package:flutter/material.dart';

// 유저 입력 데이터 저장
class User {
  String firstname = "";
  String lastname = "";
  bool isCheck = false;
}

class FormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormWidgetState();
  }
}

class FormWidgetState extends State<FormWidget> {
  //form widget의 key로 활용
  //key는 Global Key(앱 전역에서 유일), local Key(하나의 계층 내에서만 유일)
  // Key를 이용해 특정 위젯의 state 객체를 획득하겠다면 Global Key로 만들어야 함
  var formKey = GlobalKey<FormState>();
  var user = User();

  // 이벤트 콜백
  save() {
    print('save()...${user.firstname},${user.lastname},${user.isCheck}');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey, //key로 식별. 이후 form의 state 객체 획득
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'First Name'),
            validator: (value) {
              //form state의 validate() 호출시 자동 호출
              //매개변수는 유저 입력 값..
              if (value?.isEmpty ?? false) {
                //invalid.. 유저 출력 에러 메세지 리턴 ..
                return 'please enter your first name';
              }
              return null; //valid
            },
            onSaved: (value) {
              user.firstname = value!; // ! - null 이면 NPE 발생
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Last Name'),
            validator: (value) {
              if (value?.isEmpty ?? false) {
                return 'please enter your last name';
              }
              return null;
            },
            onSaved: (value) {
              user.lastname = value ?? '';
            },
          ),
          SwitchListTile(
              title: Text('check'),
              value: user.isCheck,
              onChanged: (value) {
                setState(() {
                  user.isCheck = value;
                });
              }),
          ElevatedButton(
              onPressed: () {
                // key로 state 객체 획득
                var form = formKey.currentState;
                if (form?.validate() ?? false) {
                  //모든 하위 TextFormField의 validator() 호출
                  //모든 formField에서 null이면 True
                  form?.save(); //모든 formField의 onSaved()호출
                  save();
                }
              },
              child: Text('submit')),
        ],
      ),
    );
  }
}
