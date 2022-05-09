import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String username;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/picture/IMG_5304.JPG"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            // SizedBox(height: 80,),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Harika bir gün geçirelim",
                      style: TextStyle(color: Colors.pink, fontSize: 35),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Haydi Planlayalım!",
                      style: TextStyle(color: Colors.pink, fontSize: 15),
                    )
                  ]),
            ),

            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepOrange),
                          ),
                          labelText: "Kullanıcı Adı",
                          labelStyle: TextStyle(color: Colors.deepOrange),
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Kullanıcı Adınızı Giriniz";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        username = value!;
                      },
                    ),
                    _loginButton()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() => ElevatedButton(
        child: const Text("Giriş Yap"),
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
        ),
      );
}
