import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:newnew/pages/home/home_page.dart';
import 'package:newnew/pages/login/login_process.dart';
import 'package:newnew/shared/widgets/custom_text.dart';

const Color color = Color(0xFF5D2D4C);
const Color cardColor = Color(0xFFfCf4EA);

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final LoginProcess _loginProcess = LoginProcess();

  bool isSaveData = false;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    readData();
  }

  readData() async {
    var username = await _loginProcess.readData('username');
    var password = await _loginProcess.readData('password');
    var isLogin = await _loginProcess.isLogin();

    if (isLogin != null && isLogin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color, cardColor])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 36),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const Icon(Icons.ac_unit, size: 150, color: color,),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        'assets/playstore.png',
                        width: 150,
                        height: 150,
                      )),
                  const SizedBox(height: 24),
                  CustomText(
                    text: 'Hoşgeldin!',
                    fontSize: 22,
                  ),
                  CustomText(
                    text: 'Haydi Planlayalım',
                    fontSize: 13,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _username,
                          decoration: const InputDecoration(
                            hintText: 'Kullanıcı Adı',
                            icon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 5.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen kullanıcı adınızı giriniz';
                            }
                            return null;
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          width: double.infinity,
                          height: 70,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(color),
                            ),
                            child: CustomText(
                              text: 'Giriş',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _loginProcess.writeData(
                                    'username', _username.text);
                                _loginProcess.writeData(
                                    'password', _password.text);
                                _loginProcess.writeLogin(true);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
