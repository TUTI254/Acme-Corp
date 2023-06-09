import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'create_ticket_page.dart';
import 'view_tickets.dart';

// ignore: must_be_immutable
class CustomerPage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  CustomerPage({
    Key? key,
  }) : super(key: key);
  List<String> docId = []; // document id list

  // get docId from firestore
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('tickets')
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((document) {
              docId.add(document.reference.id);
            }));
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'View all Tickets.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'LiberationMono',
                        color: Colors.grey[700],
                      ),
                    ),
                    IconButton(
                      // onpressed navigate to login page
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateTicketPage()),
                        );
                      },
                      icon: Icon(
                        Icons.note_add_outlined,
                        color: Colors.greenAccent.shade200,
                      ),
                    ),
                  ],
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
                          child: FutureBuilder(
                            future: getDocId(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: docId.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text(
                                                  "Ticket Details",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'LiberationMono',
                                                  ),
                                                ),
                                                content: GetTicketDetails(
                                                    documentId: docId[index]),
                                              );
                                            });
                                      },
                                      child: ListTile(
                                        title: GetTickets(
                                            documentId: docId[index]),
                                        tileColor: Colors.grey[200],
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          )),
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
