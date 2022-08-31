import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/services/auth_service.dart';
import 'package:flutter_app2/utils/constants.dart';
import 'package:flutter_app2/utils/dialog_custom.dart';
import 'package:flutter_app2/pages/home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController(text: "cssd1");
  TextEditingController _passwordController = TextEditingController(text: "1234");
  final formKey = GlobalKey<FormState>();
  bool isRemember = false;
  bool isOpenPass = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              isLoading ? LinearProgressIndicator() : SizedBox(),
              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Image.asset("${Constants.logoUrl}", fit: BoxFit.cover,),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: "username",
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.person,
                              color: Colors.indigoAccent,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          focusColor: Colors.lightGreen,
                        ),
                        validator: (value) {
                          if (value == "") {
                            return "Please enter username";
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      // Spacer(),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: isOpenPass,
                        decoration: InputDecoration(
                          hintText: "password",
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.key,
                              color: Colors.indigoAccent,
                            ),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              isOpenPass = !isOpenPass;
                              setState(() {});
                            },
                            child: Align(
                              widthFactor: 1.0,
                              heightFactor: 1.0,
                              child: Icon(
                                isOpenPass ? Icons.visibility : Icons.visibility_off,
                                color: Colors.indigoAccent,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 15.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value! == "") {
                            return "Password must more 5 char";
                          }

                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: isRemember,
                              onChanged: (value) {
                                rememberOnChange2(value: value!);
                              }),
                          InkWell(
                            onTap: () => rememberOnChange2(value: !isRemember),
                            child: Text("remember"),
                          ),
                        ],
                      ),
                      //OutlinedButton(onPressed: () {}, child: Text("Login")),

                      Container(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          onPressed: isLoading ? null : () {
                            // Navigator.push(context, CupertinoPageRoute(builder: (context) => HomePage()));
                            loginOnPress(_usernameController.text, _passwordController.text);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future rememberOnChange(bool value, String text) async {
    setState(() {
      isRemember = value;
    });
  }

  Future rememberOnChange2({bool value = false}) async {
    setState(() {
      isRemember = value;
    });
  }

  Future loginOnPress(String textUsername, String textPassword) async {
    if (formKey.currentState!.validate()) {
      String _username = _usernameController.text;
      String _password = _passwordController.text;

      setState(() {
        isLoading = true;
      });

      final _auth = AuthService();

      bool _result = await _auth.login(username: _username, password: _password);

      setState(() {
        isLoading = false;
      });

      String _msg = "username or password is invalid";
      if(!_result) return dialogCustom(context: context, title: "failed", content: _msg);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }

    print('Username: $textUsername Password: $textPassword');
  }

  Future<bool> checkUser({
    required String username,
    required String password,
  }) async {

    await Future.delayed(Duration(seconds: 2));

    if(username == "start" && password == "12345"){
      return true;
    }

    return false;
  }
}
