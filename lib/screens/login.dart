import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'base_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.red,
            Colors.blue,
            Colors.green,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Image.network(
              "https://oyunveuygulamaakademisi.com/assets/site/oua/assets/sites/images/homepage-images/homepage_img_8.png",
              width: 0,
              height: 1),
          title: const Text('Akademi Plus'),
        ),
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height: 17),
            _inputField("Mail", _usernameController),
            const SizedBox(height: 7),
            _inputField("Şifre", _passwordController, isPassword: true),
            const SizedBox(height: 17),
            _loginBtn(),
            const SizedBox(height: 7),
            _extraText(),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, color: Colors.white, size: 120),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.white),
    );

    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        String username = _usernameController.text;
        String password = _passwordController.text;

        if (username.isNotEmpty && password.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BaseScreen()),
          );
        } else {
          Fluttertoast.showToast(
            msg: "Lütfen mail ve şifrenizi girin!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
          );
        }
      },
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Giriş Yap! ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: Colors.white,
        onPrimary: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _extraText() {
    return const Text(
      "Hesabiniza erişemiyor musunuz?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
  }
}
