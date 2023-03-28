import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'create_customer_page.dart';

class ViewCustomers extends StatefulWidget {
  const ViewCustomers({Key? key}) : super(key: key);

  @override
  State<ViewCustomers> createState() => _ViewCustomersState();
}

class _ViewCustomersState extends State<ViewCustomers> {
  final user = FirebaseAuth.instance.currentUser!;

  //document id
  List<String> docId = [];

  // get docId from firestore
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'customer') // get only customers
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
                const SizedBox(height: 180),

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
                      'Customers #',
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'View all customers.',
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
                              builder: (context) => const CreateCustomerPage()),
                        );
                      },
                      icon: Icon(
                        Icons.person_add_alt_1_rounded,
                        color: Colors.greenAccent.shade200,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                //Email Textfield
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
                                    child: ListTile(
                                      title: GetCustomerDetails(
                                          documentId: docId[index]),
                                      tileColor: Colors.grey[200],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
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

class GetCustomerDetails extends StatelessWidget {
  final String documentId;
  const GetCustomerDetails({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get user collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(" # ${data['name']}");
          }
          return const Text("loading");
        });
  }
}
