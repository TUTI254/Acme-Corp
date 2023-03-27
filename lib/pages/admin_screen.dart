import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  final Map<String, dynamic> userData;

  const AdminPage({Key? key, required this.userData}) : super(key: key);

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
                  'Hello Admin X !',
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

                const SizedBox(height: 20),

                //Welcome Text
                Text(
                  'What do you want to do Today?.',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'LiberationMono',
                    color: Colors.grey[700],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 10,
                  thickness: 1.0,
                  indent: 100,
                  endIndent: 100,
                ),
                const SizedBox(height: 25),

                //Email Textfield
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [],
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
