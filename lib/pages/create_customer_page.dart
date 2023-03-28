import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_textfield.dart';

class CreateCustomerPage extends StatefulWidget {
  const CreateCustomerPage({Key? key}) : super(key: key);

  @override
  CreateCustomerPageState createState() => CreateCustomerPageState();
}

class CreateCustomerPageState extends State<CreateCustomerPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _roleController = TextEditingController();

  Future<void> _createCustomer() async {
    // Create a new customer
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    // add customer details to firestore
    addCustomerDetails(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _phoneController.text.trim(),
        _passwordController.text.trim(),
        _roleController.text.trim());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  Future addCustomerDetails(String name, String email, String phone,
      String password, String role) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'role': role,
    });
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
                const SizedBox(height: 150),

                Row(
                  children: [
                    const SizedBox(width: 30),
                    IconButton(
                      // onpressed navigate to login page
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_circle_left_outlined,
                          size: 40),
                    ),
                    const SizedBox(width: 50),
                    const Text(
                      'New Customer ',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LiberationMono',
                      ),
                    ),
                  ],
                ),

                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1.8,
                  indent: 100,
                  endIndent: 100,
                ),

                const SizedBox(height: 50),

                //Email Textfield
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      MyTextfield(
                        controller: _nameController,
                        hintText: 'Name',
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      MyTextfield(
                        controller: _emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      MyTextfield(
                        controller: _phoneController,
                        hintText: 'Phone number',
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      MyTextfield(
                        controller: _passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      MyTextfield(
                        controller: _roleController,
                        hintText: 'Role: customer',
                        obscureText: false,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          _createCustomer();
                          Navigator.pop(context);
                        },
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
