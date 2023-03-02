import 'package:flutter/material.dart';

import 'home_screen.dart';

class ArtisanLoginScreen extends StatefulWidget {
  const ArtisanLoginScreen({Key? key}) : super(key: key);

  @override
  _ArtisanLoginScreenState createState() => _ArtisanLoginScreenState();
}

class _ArtisanLoginScreenState extends State<ArtisanLoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // Add your login implementation here
  void _login() {
    if (_formKey.currentState!.validate()) {
      // Navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        titleTextStyle: const TextStyle(color: Colors.black),
        title: Text('Artisan Login'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the artisan screen
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.yellow)),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: _login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
