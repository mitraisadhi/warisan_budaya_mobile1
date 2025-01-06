import 'package:flutter/material.dart';
import 'package:warisan_budaya_mobile/data/shared_preference_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  var isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkIsUserLoggedIn();
  }

  void checkIsUserLoggedIn() async {
    var isLogin = await sharedPreferencesManager.isLoggedIn();
    setState(() {
      isLoggedIn = isLogin;
    });
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      await sharedPreferencesManager.login(_usernameController.text, _passwordController.text);
      Navigator.pop(context);
    }
  }

  Future<void> _logout() async {
      await sharedPreferencesManager.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: isLoggedIn ? 
        ElevatedButton(
                onPressed: _logout,
                child: Text('Logout'),
              )
        : Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Passwword'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
