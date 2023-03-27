import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.greenAccent,
          ),
        );
      },
    );
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //Email Textfield
                      MyTextfield(
                        controller: _emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      //Password Textfield
                      MyTextfield(
                        controller: _passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 30),

                      ElevatedButton(
                        onPressed: signIn,
                        style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(200, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.greenAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LiberationMono',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
