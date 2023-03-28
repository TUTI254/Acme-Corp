import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/list_container.dart';

class CustomerPage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  CustomerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      icon: const Icon(Icons.logout),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  'Hello Customer ${user.email!}',
                  style: const TextStyle(
                    fontSize: 24,
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
                Text(
                  'Tickets Raised.',
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        // item count is 10
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ListContainer(),
                            );
                          },
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
// child: Text('Hello $name, welcome to the customer page.'),
