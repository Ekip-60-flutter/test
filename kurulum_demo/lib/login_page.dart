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
                    YaziHareket(),
                    SizedBox(height: 10),
                    Text(
                      "Haydi Planlayalım!",
                      style: TextStyle(
                          fontFamily: 'PatrickHand',
                          color: Colors.pink,
                          fontSize: 30),
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

class YaziHareket extends StatefulWidget {
  const YaziHareket({Key? key}) : super(key: key);

  @override
  State<YaziHareket> createState() => _YaziHareketState();
}

class _YaziHareketState extends State<YaziHareket>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut)
      ..addListener(() => this.setState(() {}))
      ..addStatusListener((durum) {
        debugPrint(durum.toString());
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hoşgeldiniz",
      style: TextStyle(fontSize: 15.0 + _animation.value * 30),
    );
  }
}
