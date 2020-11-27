import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voli/api/alles.dart';
import 'package:voli/components/customButton.dart';
import 'package:voli/loginData.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController inputUsername = TextEditingController();
  final TextEditingController inputPassword = TextEditingController();
  bool hidePassword = true;
  bool loading = false;
  bool error = false;

  void toggleLoading() => setState(() => loading = !loading);
  void toggleError() => setState(() => error = !error);
  void togglePassword() => setState(() => hidePassword = !hidePassword);
  void login() async {
    if (error) toggleError();
    toggleLoading();
    // Do login thing
    bool result = await Alles.login(inputUsername.text, inputPassword.text);
    if (result) {
      Provider.of<LoginProvider>(context, listen: false).isLoggedIn = true;
    } else {
      toggleLoading();
      toggleError();
    }
  }

  @override
  void dispose() {
    inputUsername.dispose();
    inputPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login with your AllesID',
                  style: Theme.of(context).textTheme.headline1),
              error
                  ? Text('There was a problem trying to log in!',
                      style: TextStyle(color: Colors.red))
                  : SizedBox(height: 0),
              AutofillGroup(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                    child: TextField(
                      controller: inputUsername,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                          hintText: 'Jessica Adams#0001'),
                      maxLines: 1,
                      autofillHints: [AutofillHints.username],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: TextField(
                      controller: inputPassword,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'l337_p4ssw0rd¡',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: togglePassword,
                          )),
                      maxLines: 1,
                      obscureText: hidePassword,
                      autofillHints: [AutofillHints.password],
                    ),
                  )
                ],
              )),
              loading
                  ? CircularProgressIndicator()
                  : CustomButton(text: 'Login', onTap: login),
            ],
          ),
        ),
      ),
    );
  }
}
