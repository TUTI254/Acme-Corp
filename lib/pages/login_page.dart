import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // login controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // login function
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 180),

              //Login Text
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LiberationMono',
                ),
              ),

              const Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1.8,
                indent: 100,
                endIndent: 100,
              ),

              const SizedBox(height: 50),

              //Welcome Text
              Text(
                'Welcome Back to Acme Corp.',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'LiberationMono',
                  color: Colors.grey[700],
                ),
              ),

              const SizedBox(height: 25),

              //Email Textfield
              MyTextfield(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              //Password Textfield
              MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 30),

              //Login Button
              MyButton(
                onTap: signUserIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
