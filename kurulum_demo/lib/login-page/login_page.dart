// ignore: file_names
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:kurulum_demo/custom-widgets/my_text.dart';
import 'package:kurulum_demo/home-page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _kadi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/picture/IMG_5304.JPG"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(3),
                        child: MyText(
                          text: 'Hoşgeldiniz',
                          fontSize: 28,
                        )),
                    AnimatedTextKit(repeatForever: true, animatedTexts: [
                      TypewriterAnimatedText('Hadi Başlayalım !!!',
                          speed: Duration(milliseconds: 125)),
                    ]),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                color: Colors.transparent.withOpacity(0.1),
                child: Container(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _kadi,
                          decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepOrange),
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
                        ),
                        ElevatedButton(
                          child: const Text("Giriş Yap"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(name: _kadi.text)));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepOrange),
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
