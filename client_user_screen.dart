import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

class ClientUserScreen extends StatelessWidget {
  const ClientUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[600],
        title: const Text('User'),
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GlamSpot logo
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/logo.jpg'),
              ),
              // Welcome message
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Welcome to GlamSpot! Whether you\'re a new or returning user, we\'re excited to have you here. If you already have an account, please log in to continue. If you\'re new to GlamSpot, please sign up to discover our wide range of services and book appointments with our talented artisans.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40.0),
              // Login and Signup buttons
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text('Login',
                          style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: Colors.yellow[600],
                        // textStyle: const TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text('Signup'),
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        primary: Colors.black87,
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
