import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'view_customers.dart';

class AgentPage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  AgentPage({Key? key}) : super(key: key);

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
                  'Hello Agent ${user.email!}',
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // grid container
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ViewCustomers()),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.greenAccent,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '# Customers',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'LiberationMono',
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.book,
                                    size: 30,
                                    color: Colors.greenAccent,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '# Tickets',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'LiberationMono',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
