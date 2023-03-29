import 'package:acme_corp/pages/agent_screen.dart';
import 'package:acme_corp/pages/customer_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final List<String> _agentEmails = [
    'tutidavid@hotmail.com',
    'vagas@gmail.com'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // snapshot.data?.uid is the user's ID, or null if they are not logged in
          // check if snapshot has data and if the user's email is in the list of agent emails
          if (snapshot.hasData && _agentEmails.contains(snapshot.data?.email)) {
            return AgentPage();
          } else if (snapshot.hasData && snapshot.data?.uid != null) {
            return CustomerPage();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
