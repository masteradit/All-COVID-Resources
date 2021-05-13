import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    late String _email;
    late String _password;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.2),
          children: [
            TextFormField(
              onChanged: (value) {
                _email = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }

                return null;
              },
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }

                return null;
              },
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _email,
                    password: _password,
                  );
                }
              },
              child: Text('SUBMIT'),
            ),
          ],
        ),
      ),
    );
  }
}
